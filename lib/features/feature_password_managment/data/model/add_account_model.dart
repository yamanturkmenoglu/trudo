// To parse this JSON data, do
//
//     final addAccountModel = addAccountModelFromJson(jsonString);

import 'dart:convert';

AddAccountModel addAccountModelFromJson(String str) =>
    AddAccountModel.fromJson(json.decode(str));

String addAccountModelToJson(AddAccountModel data) =>
    json.encode(data.toJson());

class AddAccountModel {
  String? url;
  String? name;
  String? password;
  String? category;

  AddAccountModel({
    this.url,
    this.name,
    this.password,
    this.category,
  });

  AddAccountModel copyWith({
    String? url,
    String? name,
    String? password,
    String? category,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      AddAccountModel(
        url: url ?? this.url,
        name: name ?? this.name,
        password: password ?? this.password,
        category: category ?? this.category,
      );

  factory AddAccountModel.fromJson(Map<String, dynamic> json) =>
      AddAccountModel(
        url: json["url"],
        name: json["name"],
        password: json["password"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "password": password,
        "category": category,
      };

  @override
  String toString() {
    return 'AddAccountModel{url: $url, name: $name, password: $password, category: $category}';
  }
}
