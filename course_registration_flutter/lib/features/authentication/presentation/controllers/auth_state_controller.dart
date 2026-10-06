// ignore_for_file: prefer_initializing_formals

import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/foundation.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthStateController extends ChangeNotifier {
  AuthStateController(
    this._repository, {
    Future<void> Function()? onAuthenticated,
  }) : _onAuthenticated = onAuthenticated;
  final AuthRepository _repository;
  final Future<void> Function()? _onAuthenticated;
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
      _profile = await _repository.restore();
      if (_profile != null) await _onAuthenticated?.call();
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
      _profile = await _repository.login(email, password);
      await _onAuthenticated?.call();
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
    _profile = await _repository.completeProfile(fullName: fullName);
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
}
