import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trudo/core/hive/user.dart';

class Initializer {
  static Future<void> initializeMainApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Hive for Flutter
    await Hive.initFlutter();
    Hive.registerAdapter(UserHiveModelAdapter());
    await Hive.openBox<UserHiveModel>('userBox');
  }
}
