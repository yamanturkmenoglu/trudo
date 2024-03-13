// To parse this JSON data, do
//
//     final checkTokenModel = checkTokenModelFromJson(jsonString);

import 'dart:convert';

import 'package:trudo/features/feature_auth/feature_login/data/models/user.dart';

CheckTokenModel checkTokenModelFromJson(String str) => CheckTokenModel.fromJson(json.decode(str));

String checkTokenModelToJson(CheckTokenModel data) => json.encode(data.toJson());

class CheckTokenModel {
  String? status;
  String? accessToken;
  User? user;

  CheckTokenModel({
    this.status,
    this.accessToken,
    this.user,
  });

  factory CheckTokenModel.fromJson(Map<String, dynamic> json) => CheckTokenModel(
    status: json["status"],
    accessToken: json["accessToken"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "accessToken": accessToken,
    "user": user?.toJson(),
  };
}

// class User {
//   String? id;
//   String? name;
//   String? phoneNumber;
//   String? username;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   List<String>? roles;
//   List<WishList>? wishList;
//   List<Cart>? cart;
//   String? lastname;
//   bool? active;
//   List<AddressId>? addressIds;
//   List<CheckOutId>? checkOutIds;
//   Avatar? avatar;
//
//   User({
//     this.id,
//     this.name,
//     this.phoneNumber,
//     this.username,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.roles,
//     this.wishList,
//     this.cart,
//     this.lastname,
//     this.active,
//     this.addressIds,
//     this.checkOutIds,
//     this.avatar,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["_id"],
//     name: json["name"],
//     phoneNumber: json["phoneNumber"],
//     username: json["username"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
//     wishList: json["wishList"] == null ? [] : List<WishList>.from(json["wishList"]!.map((x) => WishList.fromJson(x))),
//     cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
//     lastname: json["lastname"],
//     active: json["active"],
//     addressIds: json["addressIds"] == null ? [] : List<AddressId>.from(json["addressIds"]!.map((x) => AddressId.fromJson(x))),
//     checkOutIds: json["checkOutIds"] == null ? [] : List<CheckOutId>.from(json["checkOutIds"]!.map((x) => CheckOutId.fromJson(x))),
//     avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "name": name,
//     "phoneNumber": phoneNumber,
//     "username": username,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
//     "wishList": wishList == null ? [] : List<dynamic>.from(wishList!.map((x) => x.toJson())),
//     "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
//     "lastname": lastname,
//     "active": active,
//     "addressIds": addressIds == null ? [] : List<dynamic>.from(addressIds!.map((x) => x.toJson())),
//     "checkOutIds": checkOutIds == null ? [] : List<dynamic>.from(checkOutIds!.map((x) => x.toJson())),
//     "avatar": avatar?.toJson(),
//   };
// }








