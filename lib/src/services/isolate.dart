import 'package:flutter/services.dart';

class IsolateService {
  static IsolateService? _instance;

  static Future<IsolateService?> getInstance() async {
    _instance ??= IsolateService();
    return _instance;
  }

  void isolateMain(RootIsolateToken rootIsolateToken) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  }
}