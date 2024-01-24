import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MySecureStorage {
  static MySecureStorage? _instance;
  final String _tokenKey = 'TOKEN_KEY';

  // Create storage
  FlutterSecureStorage _storage = const FlutterSecureStorage();

  static MySecureStorage getInstance() {
    _instance ??= MySecureStorage._();
    return _instance!;
  }

  MySecureStorage._() {
    if (Platform.isAndroid) {
      _storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );
    } else {
      _storage = const FlutterSecureStorage();
    }
  }

  Future<String?> readToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<bool> hasToken() async{
    return await _storage.containsKey(key: _tokenKey);
  }
}
