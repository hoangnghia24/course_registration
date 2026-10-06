import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkHandler {
  NetworkHandler([Connectivity? connectivity])
    : _connectivity = connectivity ?? Connectivity();
  final Connectivity _connectivity;
  Stream<List<ConnectivityResult>> get changes =>
      _connectivity.onConnectivityChanged;
  Future<bool> get hasNetwork async => (await _connectivity.checkConnectivity())
      .any((item) => item != ConnectivityResult.none);
}
