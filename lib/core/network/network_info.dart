import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker? connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    // In web or during tests, assume there's a connection to avoid platform-specific errors
    if (kIsWeb) {
      return true;
    }

    try {
      if (kIsWeb) {
        return true;
      }

      if (connectionChecker != null) {
        return await connectionChecker!.hasConnection;
      } else {
        // Fallback method - try to look up a well-known host
        try {
          final result = await InternetAddress.lookup('google.com');
          return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
        } on SocketException catch (_) {
          return false;
        }
      }
    } catch (e) {
      // If there's any error, assume we're connected to handle the case gracefully
      return true;
    }
  }
}
