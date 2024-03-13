// To parse this JSON data, do
//
//     final projectDetailsModel = projectDetailsModelFromJson(jsonString);

import 'dart:convert';

ProjectDetailsModel projectDetailsModelFromJson(String str) => ProjectDetailsModel.fromJson(json.decode(str));

String projectDetailsModelToJson(ProjectDetailsModel data) => json.encode(data.toJson());

class ProjectDetailsModel {
  String? id;
  String? title;
  String? description;
  DateTime? startDate;
  DateTime? endDate;
  int? taskCount;
  List<ListElement>? lists;
  List<dynamic>? members;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProjectDetailsModel({
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
  });

  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) => ProjectDetailsModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    taskCount: json["taskCount"],
    lists: json["lists"] == null ? [] : List<ListElement>.from(json["lists"]!.map((x) => ListElement.fromJson(x))),
    members: json["members"] == null ? [] : List<dynamic>.from(json["members"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "taskCount": taskCount,
    "lists": lists == null ? [] : List<dynamic>.from(lists!.map((x) => x.toJson())),
    "members": members == null ? [] : List<dynamic>.from(members!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class ListElement {
  String? title;
  List<Card>? cards;
  String? id;

  ListElement({
    this.title,
    this.cards,
    this.id,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    title: json["title"],
    cards: json["cards"] == null ? [] : List<Card>.from(json["cards"]!.map((x) => Card.fromJson(x))),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "cards": cards == null ? [] : List<dynamic>.from(cards!.map((x) => x.toJson())),
    "_id": id,
  };
}

class Card {
  String? id;
  String? name;
  String? description;
  String? status;
  String? dueDate;
  List<dynamic>? comments;
  String? project;
  String? parent;
  List<String>? subTasks;
  int? priority;
  List<Action>? actions;
  List<dynamic>? files;
  bool? done;
  String? assignedTo;
  List<String>? dependencies;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Card({
    this.id,
    this.name,
    this.description,
    this.status,
    this.dueDate,
    this.comments,
    this.project,
    this.parent,
    this.subTasks,
    this.priority,
    this.actions,
    this.files,
    this.done,
    this.assignedTo,
    this.dependencies,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    status: json["status"],
    dueDate: json["dueDate"],
    comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
    project: json["project"],
    parent: json["parent"],
    subTasks: json["subTasks"] == null ? [] : List<String>.from(json["subTasks"]!.map((x) => x)),
    priority: json["priority"],
    actions: json["actions"] == null ? [] : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
    files: json["files"] == null ? [] : List<dynamic>.from(json["files"]!.map((x) => x)),
    done: json["done"],
    assignedTo: json["assignedTo"],
    dependencies: json["dependencies"] == null ? [] : List<String>.from(json["dependencies"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "status": status,
    "dueDate": dueDate,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
    "project": project,
    "parent": parent,
    "subTasks": subTasks == null ? [] : List<dynamic>.from(subTasks!.map((x) => x)),
    "priority": priority,
    "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
    "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
    "done": done,
    "assignedTo": assignedTo,
    "dependencies": dependencies == null ? [] : List<dynamic>.from(dependencies!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Action {
  String? title;
  String? description;
  String? user;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  Action({
    this.title,
    this.description,
    this.user,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
    title: json["title"],
    description: json["description"],
    user: json["user"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "user": user,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
