import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:trudo/core/hive/user.dart';

class UserInformationProvider with ChangeNotifier, DiagnosticableTreeMixin {
  UserHiveModel _userHiveModel = UserHiveModel();

  UserHiveModel get userHiveModel => _userHiveModel;


  String get userName => _userHiveModel.name ?? "";

  setUserHiveModel(UserHiveModel user, String password) {
    log("setUserHiveModel ${user.role}");
    _userHiveModel = UserHiveModel(
        role: user.role,
        id: user.id,
        accessToken: user.accessToken,
        name: user.name,
        password: password,
        username: user.username,
        phone: user.phone);
    notifyListeners();
  }
}