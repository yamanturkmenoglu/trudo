class User {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  List<dynamic>? teamMembers;
  List<String>? roles;
  bool? active;
  String? username;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.teamMembers,
    this.roles,
    this.active,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    teamMembers: json["teamMembers"] == null ? [] : List<dynamic>.from(json["teamMembers"]!.map((x) => x)),
    roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
    active: json["active"],
    username: json["username"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "teamMembers": teamMembers == null ? [] : List<dynamic>.from(teamMembers!.map((x) => x)),
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
    "active": active,
    "username": username,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}