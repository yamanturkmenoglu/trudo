import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/features/features_project&tasks/cubit/edit_add_task_cubit/edit_add_task_cubit_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskState.initial());

  setName(String name) {
    emit(state.copyWith(name: name, statusAddCard: StatusAddCard.initial));
  }

  setDescription(String description) {
    emit(state.copyWith(
        description: description, statusAddCard: StatusAddCard.initial));
  }

  setStatus(String status) {
    emit(state.copyWith(status: status, statusAddCard: StatusAddCard.initial));
  }

  setDueDate(String dueDate) {
    emit(
        state.copyWith(dueDate: dueDate, statusAddCard: StatusAddCard.initial));
  }

  setProject(String project) {
    emit(
        state.copyWith(project: project, statusAddCard: StatusAddCard.initial));
  }

  setParent(String parent) {
    emit(state.copyWith(parent: parent, statusAddCard: StatusAddCard.initial));
  }

  setSubTasks(String subTasks) {
    emit(state.copyWith(
        subTasks: subTasks, statusAddCard: StatusAddCard.initial));
  }

  setDone(int priority) {
    emit(state.copyWith(
        priority: priority, statusAddCard: StatusAddCard.initial));
  }

  setAssignedTo(String assignedTo) {
    emit(state.copyWith(
        assignedTo: assignedTo, statusAddCard: StatusAddCard.initial));
  }

  setDependencies(List<String> dependencies) {
    emit(state.copyWith(
        dependencies: dependencies, statusAddCard: StatusAddCard.initial));
  }

  setPriority(int priority) {
    emit(state.copyWith(
        priority: priority, statusAddCard: StatusAddCard.initial));
  }

  // setConvertedFiles(List<Avatar> files){
  //   log("json Decode ${(files)}");
  //   emit(state.copyWith( files: files , status: Status.initial));
  // }
  Future<void> addTask({required BuildContext context}) async {
    UserInformationProvider? userInformationProvider;
    userInformationProvider =
        Provider.of<UserInformationProvider>(context, listen: false);
    emit(state.copyWith(statusAddCard: StatusAddCard.loading));

    if (state.statusAddCard == StatusAddCard.submitting) return;
    emit(state.copyWith(statusAddCard: StatusAddCard.submitting));

    try {
      Map<String, String> header = {
        HttpHeaders.authorizationHeader:
            'Bearer ${userInformationProvider.userHiveModel.accessToken}',
        "Content-Type": "application/json"
      };

      final addTaskBody = jsonEncode({
        "name": state.name,
        "description": state.description,
        "status": "back_log",
        //  "priority": state.priority,
        "project": state.project,
        "parent": "0",
        // "files": ["test"],
        //  "dueDate": state.dueDate,
        // "comments": "test",
        // "subTasks": "test",
        // "done": "0,1 ,2",
        // "assignedTo": state.assignedTo,
        // "dependencies": ["0,1 ,2"]
      });
      log(" response addTask $addTaskBody");

      final response = await http.post(Uri.parse("$baseUrl/cards"),
          body: addTaskBody, headers: header);

      log(" response addTask ${response.statusCode}  ${response.body}");

      if (response.statusCode == 200) {
        emit(state.copyWith(statusAddCard: StatusAddCard.success));
        log(" ${response.statusCode} response add Task");
      } else {
        emit(state.copyWith(statusAddCard: StatusAddCard.error));
      }
    } catch (_) {
      emit(state.copyWith(statusAddCard: StatusAddCard.error));
      throw "__ $_";
    }
  }

  Future<void> editTask({required BuildContext context, String? taskId}) async {
    UserInformationProvider? userInformationProvider;
    userInformationProvider =
        Provider.of<UserInformationProvider>(context, listen: false);
    emit(state.copyWith(statusAddCard: StatusAddCard.loading));

    if (state.statusAddCard == StatusAddCard.submitting) return;
    emit(state.copyWith(statusAddCard: StatusAddCard.submitting));

    try {
      Map<String, String> header = {
        HttpHeaders.authorizationHeader:
            'Bearer ${userInformationProvider.userHiveModel.accessToken}',
        "Content-Type": "application/json"
      };

      final editTaskBody = jsonEncode({
        "name": state.name,
        "description": state.description,

        "priority": state.priority,
        "project": "658f6b5b0f393fb40d59aebd",

        // "files": ["test"],
        "dueDate": state.dueDate,

        "assignedTo": state.assignedTo,
        "dependencies": state.dependencies
      });
      log(" response addTask===================== $editTaskBody");

      final response = await http.put(Uri.parse("$baseUrl/cards/$taskId"),
          body: editTaskBody, headers: header);

      log(" response edit task ${response.statusCode}  ${response.body}");

      if (response.statusCode == 200) {
        emit(state.copyWith(statusAddCard: StatusAddCard.success));
        emit(state.copyWith(statusAddCard: StatusAddCard.initial));

        log(" ${response.statusCode} response editTaskBody Task");
      } else {
        emit(state.copyWith(statusAddCard: StatusAddCard.error));
      }
    } catch (_) {
      emit(state.copyWith(statusAddCard: StatusAddCard.error));
      throw "__ $_";
    }
  }
}
