


import 'package:hive/hive.dart';
import 'package:trudo/core/hive/user.dart';

class UserBox {
  static Box<UserHiveModel>? _instance;

  static Future<Box<UserHiveModel>> getInstance() async {
    _instance = await Hive.openBox<UserHiveModel>('userBox');
    return _instance!;
  }

  static Future<void> putBox(String key, UserHiveModel value) async {
    final box = await getInstance();
    await box.put(key, value);
  }
  static Future<Box<UserHiveModel>?> getUserBox() async {
    final box = await getInstance();
    _instance = box;
    return _instance;
  }

  static Future<void> clearBox() async {
    final box = await getInstance();
    await box.clear();
  }

  static Future<void> closeBox() async {
    final box = await getInstance();
    await box.close();
    _instance = null;
  }
}