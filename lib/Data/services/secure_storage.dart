import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage? _instance;

  factory SecureStorage() =>
      _instance ??= SecureStorage._(const FlutterSecureStorage());

  SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;
  static const _tokenKey = 'TOKEN';
  static const _phoneKey = 'PHONE';
  static const _localeKey = 'LANG';

  Future<void> persistPhoneAndToken(String phone, String token) async {
    await _storage.write(key: _phoneKey, value: phone);
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> writeToLocalStorage(String keyValue, String value) async {
    // String? previousKey = _storage.read(key: key);
    // if (_storage.read(key: key)) {}
    await _storage.write(key: keyValue, value: value);
    await _storage.write(key: keyValue, value: value);
  }

  Future<String> readFromLocalStorage(String key) async {
    return await _storage.read(key: key) ?? "";
  }

  

  Future<void> persistLocale(String locale) async {
    await _storage.write(key: _localeKey, value: locale);
  }

  Future<bool> hasToken() async {
    var value = await _storage.read(key: _tokenKey);
    return value != null;
  }

  Future<bool> hasPhone() async {
    var value = _storage.read(key: _phoneKey);
    return value != null;
  }

  Future<bool> hasLocale() async {
    var value = _storage.read(key: _localeKey);
    return value != null;
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<void> deletePhone() async {
    return _storage.delete(key: _phoneKey);
  }

  Future<void> deleteLocale() async {
    return _storage.delete(key: _localeKey);
  }

  Future<String?> getPhone() async {
    return _storage.read(key: _phoneKey);
  }

  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<String?> getLocale() async {
    return _storage.read(key: _localeKey);
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }
}
