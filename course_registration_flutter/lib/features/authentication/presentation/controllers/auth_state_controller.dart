// ignore_for_file: prefer_initializing_formals

import 'dart:async';

import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/foundation.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthStateController extends ChangeNotifier {
  AuthStateController(
    this._repository, {
    Future<void> Function()? onAuthenticated,
    Duration authenticationTimeout = const Duration(seconds: 12),
  }) : _onAuthenticated = onAuthenticated,
       _authenticationTimeout = authenticationTimeout;
  final AuthRepository _repository;
  final Future<void> Function()? _onAuthenticated;
  final Duration _authenticationTimeout;
  AppUser? _profile;
  Object? _error;
  bool _initialized = false;
  bool _loading = false;
  AppUser? get profile => _profile;
  Object? get error => _error;
  bool get initialized => _initialized;
  bool get loading => _loading;
  bool get isAuthenticated => _profile != null && _repository.isAuthenticated;

  Future<void> restore() async {
    try {
      _profile = await _repository.restore().timeout(_authenticationTimeout);
      if (_profile != null) _runPostAuthenticationWork();
    } catch (error) {
      _error = error;
    } finally {
      _initialized = true;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _setLoading(true);
    try {
      _profile = await _repository
          .login(email, password)
          .timeout(_authenticationTimeout);
      _runPostAuthenticationWork();
      _error = null;
      return true;
    } catch (error) {
      _error = error;
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> refreshProfile({String? fullName}) async {
    _profile = await _repository
        .completeProfile(fullName: fullName)
        .timeout(_authenticationTimeout);
    _error = null;
    notifyListeners();
  }

  Future<void> logout() async {
    await _repository.logout();
    _profile = null;
    _error = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void _runPostAuthenticationWork() {
    final callback = _onAuthenticated;
    if (callback == null) return;
    // Cache synchronization is best-effort background work. Authentication
    // must not remain blocked if the network or local database is slow.
    unawaited(callback().catchError((Object _) {}));
  }
}
