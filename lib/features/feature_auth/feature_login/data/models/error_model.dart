// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  bool? success;
  String? status;
  Err? err;

  ErrorModel({
    this.success,
    this.status,
    this.err,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    success: json["success"],
    status: json["status"],
    err: json["err"] == null ? null : Err.fromJson(json["err"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "err": err?.toJson(),
  };
}

class Err {
  String? name;
  String? message;

  Err({
    this.name,
    this.message,
  });

  factory Err.fromJson(Map<String, dynamic> json) => Err(
    name: json["name"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "message": message,
  };
}
