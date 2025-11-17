import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelperSecure {
  static late FlutterSecureStorage storage;

  static initialSecureStorage() async {
    storage = const FlutterSecureStorage();
  }

  static Future<void> setData({
    required String key,
    required String value,
  }) async {
    return await storage.write(key: key, value: value);
  }

  static Future<String?> getData({required String key}) {
    return storage.read(key: key);
  }

  static Future<void> removeData({required String key}) async {
    return await storage.delete(key: key);
  }

  static Future<void> removeAllData() async {
    return await storage.deleteAll();
  }
}
