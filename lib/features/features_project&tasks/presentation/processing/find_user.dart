

import 'package:trudo/features/features_project&tasks/data/model/all_users_model.dart';

AllUsersModel? findUser(List<AllUsersModel> allUsers, String id) {
  try {
    return allUsers.firstWhere((user) => user.id == id);
  } catch (e) {
    return null;
  }
}
