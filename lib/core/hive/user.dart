import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserHiveModel extends HiveObject {
  @HiveField(0)
  late String? accessToken;

  @HiveField(1)
  late String? id;

  @HiveField(2)
  late String? role;

  @HiveField(3)
  late String? name;

  @HiveField(4)
  late String? username;

  @HiveField(5)
  late String? password;

  @HiveField(6)
  late bool? firstTimeAppOpened;

  @HiveField(7)
  late String? phone;

  @HiveField(8)
  late String? center;

  @HiveField(9)
  late String? step;

  UserHiveModel(
      {this.accessToken,
      this.id,
      this.role,
      this.name,
      this.username,
      this.password,
      this.firstTimeAppOpened,
      this.phone,
      this.center,
      this.step});

  @override
  String toString() {
    return 'UserHiveModel{accessToken: $accessToken, id: $id, role: $role, name: $name, username: $username, password: $password, firstTimeAppOpened: $firstTimeAppOpened, phone: $phone, center: $center}';
  }
}
