// To parse this JSON data, do
//
//     final allPasswordCategoryModel = allPasswordCategoryModelFromJson(jsonString);

import 'dart:convert';

List<AllPasswordCategoryModel> allPasswordCategoryModelFromJson(String str) =>
    List<AllPasswordCategoryModel>.from(
        json.decode(str).map((x) => AllPasswordCategoryModel.fromJson(x)));

String allPasswordCategoryModelToJson(List<AllPasswordCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPasswordCategoryModel {
  String? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AllPasswordCategoryModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  AllPasswordCategoryModel copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      AllPasswordCategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory AllPasswordCategoryModel.fromJson(Map<String, dynamic> json) =>
      AllPasswordCategoryModel(
        id: json["_id"],
        name: json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
