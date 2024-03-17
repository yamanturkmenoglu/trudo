// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

List<AccountModel> accountModelFromJson(String str) => List<AccountModel>.from(
    json.decode(str).map((x) => AccountModel.fromJson(x)));

String accountModelToJson(List<AccountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
AccountModel accountsModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountsModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  String? id;
  String? url;
  String? name;
  String? password;
  Category? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  dynamic image;

  AccountModel({
    this.id,
    this.url,
    this.name,
    this.password,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
  });

  AccountModel copyWith({
    String? id,
    String? url,
    String? name,
    String? password,
    Category? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    dynamic image,
  }) =>
      AccountModel(
        id: id ?? this.id,
        url: url ?? this.url,
        name: name ?? this.name,
        password: password ?? this.password,
        category: category ?? this.category,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        image: image ?? this.image,
      );

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["_id"],
        url: json["url"],
        name: json["name"],
        password: json["password"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
        "name": name,
        "password": password,
        "category": category?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "image": image,
      };

      @override
      String toString() {
        return 'AccountModel(id: $id, url: $url, name: $name, password: $password, category: $category, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, image: $image)';
      }
}

class Category {
  String? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Category copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

   @override
  String toString() {
    return 'Category{id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}
