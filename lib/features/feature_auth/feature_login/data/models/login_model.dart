// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:trudo/features/feature_auth/feature_login/data/models/user.dart';


LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  String? status;
  String? accessToken;
  User? user;

  LoginModel({
    this.success,
    this.status,
    this.accessToken,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    status: json["status"],
    accessToken: json["accessToken"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "accessToken": accessToken,
    "user": user?.toJson(),
  };
}


