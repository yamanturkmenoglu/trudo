import 'dart:convert';

List<MyTaskModel> myTaskModelFromJson(String str) => List<MyTaskModel>.from(
    json.decode(str).map((x) => MyTaskModel.fromJson(x)));

String myTaskModelToJson(List<MyTaskModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyTaskModel {
  String? id;
  String? name;
  String? description;
  String? status;
  List<dynamic>? comments;
  String? project;
  String? parent;
  List<dynamic>? subTasks;
  int? priority;
  List<Action>? actions;
  List<dynamic>? files;
  bool? done;
  String? assignedTo;
  List<dynamic>? dependencies;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? dueDate;

  MyTaskModel({
    this.id,
    this.name,
    this.description,
    this.status,
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
    this.dueDate,
  });

  factory MyTaskModel.fromJson(Map<String, dynamic> json) {
    return MyTaskModel(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      status: json["status"],
      comments: json["comments"] == null
          ? []
          : List<dynamic>.from(json["comments"]!.map((x) => x)),
      project: json["project"],
      parent: json["parent"],
      subTasks: json["subTasks"] == null
          ? []
          : List<dynamic>.from(json["subTasks"]!.map((x) => x)),
      priority: json["priority"],
      actions: json["actions"] == null
          ? []
          : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
      files: json["files"] == null
          ? []
          : List<dynamic>.from(json["files"]!.map((x) => x)),
      done: json["done"],
      assignedTo: json["assignedTo"],
      dependencies: json["dependencies"] == null
          ? []
          : List<dynamic>.from(json["dependencies"]!.map((x) => x)),
      createdAt: _parseDate(json["createdAt"]),
      updatedAt: _parseDate(json["updatedAt"]),
      v: json["__v"],
      dueDate: _parseDate(json["dueDate"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "status": status,
        "comments":
            comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
        "project": project,
        "parent": parent,
        "subTasks":
            subTasks == null ? [] : List<dynamic>.from(subTasks!.map((x) => x)),
        "priority": priority,
        "actions": actions == null
            ? []
            : List<dynamic>.from(actions!.map((x) => x.toJson())),
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
        "done": done,
        "assignedTo": assignedTo,
        "dependencies": dependencies == null
            ? []
            : List<dynamic>.from(dependencies!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "dueDate": dueDate?.toIso8601String(),
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

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      title: json["title"],
      description: json["description"],
      user: json["user"],
      id: json["_id"],
      createdAt: _parseDate(json["createdAt"]),
      updatedAt: _parseDate(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "user": user,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

DateTime? _parseDate(dynamic date) {
  if (date == null) return null;
  if (date is String) {
    try {
      return DateTime.parse(date);
    } catch (e) {
      final List<String> parts = date.split(' ');
      if (parts.length >= 6) {
        final List<String> months = [
          "Jan",
          "Feb",
          "Mar",
          "Apr",
          "May",
          "Jun",
          "Jul",
          "Aug",
          "Sep",
          "Oct",
          "Nov",
          "Dec"
        ];
        final int year = int.parse(parts[3]);
        final int month = months.indexOf(parts[1]) + 1;
        final int day = int.parse(parts[2]);
        final List<String> timeParts = parts[4].split(':');
        final int hour = int.parse(timeParts[0]);
        final int minute = int.parse(timeParts[1]);
        final int second = int.parse(timeParts[2]);
        return DateTime(year, month, day, hour, minute, second);
      }
    }
  }
  return null;
}
