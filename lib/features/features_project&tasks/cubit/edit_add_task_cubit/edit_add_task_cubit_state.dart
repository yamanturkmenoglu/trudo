

import 'package:equatable/equatable.dart';

enum StatusAddCard {
  initial,
  submitting,
  success,
  updateDoneAndUpgrade,
  error,
  loading
}

class AddTaskState extends Equatable {
  final String name;
  final String description;
  final String status;
  final String dueDate;
  final String comments;
  final String project;
  final String parent;
  final String subTasks;
  final int priority;
  final String assignedTo;
  final List<String> dependencies;
  // final List<Avatar> files;
  final StatusAddCard statusAddCard;

  const AddTaskState(
      {required this.name,
      required this.description,
      required this.status,
      required this.dueDate,
      required this.comments,
      required this.project,
      required this.parent,
      required this.subTasks,
      required this.priority,
      required this.assignedTo,
      required this.dependencies,
      required this.statusAddCard});

  factory AddTaskState.initial() {
    return const AddTaskState(
      name: "",
      description: "",
      status: "",
      dueDate: "",
      comments: "",
      project: "",
      parent: "",
      // files: [],
      subTasks: "",

      assignedTo: "",
      dependencies: [],
      priority: 0,
      statusAddCard: StatusAddCard.initial,
    );
  }

  AddTaskState copyWith(
      {String? name,
      String? description,
      String? status,
      String? dueDate,
      StatusAddCard? statusAddCard,
      String? subTasks,
      String? comments,
      String? project,
      String? parent,
      String? assignedTo,
      List<String>? dependencies,
      int? priority}) {
    return AddTaskState(
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      comments: comments ?? this.comments,
      project: project ?? this.project,
      parent: parent ?? this.parent,
      subTasks: subTasks ?? this.subTasks,
      priority: priority ?? this.priority,
      dependencies: dependencies ?? this.dependencies,
      assignedTo: assignedTo ?? this.assignedTo,
      statusAddCard: statusAddCard ?? this.statusAddCard,
    );
  }

  @override
  List<Object?> get props => [
        name,
        description,
        status,
        dueDate,
        comments,
        project,
        subTasks,
        parent,
        priority,
        dependencies,
        assignedTo,
        statusAddCard
      ];
}
