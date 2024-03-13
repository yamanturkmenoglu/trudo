// To parse this JSON data, do
//
//     final projectsModel = projectsModelFromJson(jsonString);

import 'dart:convert';

List<ProjectsModel> projectsModelFromJson(String str) => List<ProjectsModel>.from(json.decode(str).map((x) => ProjectsModel.fromJson(x)));

String projectsModelToJson(List<ProjectsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectsModel {
  String? id;
  String? title;
  String? description;
  DateTime? startDate;
  String? endDate;
  int? taskCount;
  List<ListElement>? lists;
  List<dynamic>? members;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Image? image;
  String? category;

  ProjectsModel({
    this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.taskCount,
    this.lists,
    this.members,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
    this.category,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"],
    taskCount: json["taskCount"],
    lists: json["lists"] == null ? [] : List<ListElement>.from(json["lists"]!.map((x) => ListElement.fromJson(x))),
    members: json["members"] == null ? [] : List<dynamic>.from(json["members"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate,
    "taskCount": taskCount,
    "lists": lists == null ? [] : List<dynamic>.from(lists!.map((x) => x.toJson())),
    "members": members == null ? [] : List<dynamic>.from(members!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "image": image?.toJson(),
    "category": category,
  };
}

class Image {
  String? filename;
  String? url;
  String? message;
  int? status;

  Image({
    this.filename,
    this.url,
    this.message,
    this.status,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    filename: json["filename"],
    url: json["url"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "filename": filename,
    "url": url,
    "message": message,
    "status": status,
  };
}

class ListElement {
  String? title;
  List<dynamic>? cards;
  String? id;

  ListElement({
    this.title,
    this.cards,
    this.id,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    title: json["title"],
    cards: json["cards"] == null ? [] : List<dynamic>.from(json["cards"]!.map((x) => x)),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "cards": cards == null ? [] : List<dynamic>.from(cards!.map((x) => x)),
    "_id": id,
  };
}
