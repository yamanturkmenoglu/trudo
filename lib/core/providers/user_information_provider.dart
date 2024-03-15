import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:trudo/core/hive/user.dart';

class UserInformationProvider with ChangeNotifier, DiagnosticableTreeMixin {
  UserHiveModel _userHiveModel = UserHiveModel();
  static final UserInformationProvider _instance =
      UserInformationProvider._internal();

  factory UserInformationProvider() {
    return _instance;
  }

  UserInformationProvider._internal();
  UserHiveModel get userHiveModel => _userHiveModel;

  String get userName => _userHiveModel.name ?? "";

  setUserHiveModel(UserHiveModel user, String password) {
    log("setUserHiveModel $user");
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
