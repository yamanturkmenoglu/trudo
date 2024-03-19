import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_tasks_cubit/projects_tasks_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart';


class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  ProjectDetailsCubit() : super(ProjectDetailsInitial());

  final StreamController<ProjectDetailsModel> profileController = StreamController.broadcast();


  Stream<ProjectDetailsModel> getProjectDetails(BuildContext context,String projectId) async* {
    final url = "$baseUrl/projects/$projectId";

    UserInformationProvider? userInformationProvider;
    userInformationProvider =  Provider.of<UserInformationProvider>(context , listen:  false);
   // emit(ProjectDetailsLoading());
    Map<String, String> header = {HttpHeaders.authorizationHeader: 'Bearer ${userInformationProvider.userHiveModel.accessToken}'};

    final response = await http.get(Uri.parse(url), headers: header);
    log("response.statusCode get ProjectDetails ${(response.body)}");

    if (response.statusCode == 200) {
      yield projectDetailsModelFromJson(response.body);
    } else {
      throw Exception('Failed to load Project details');
    }
  }

  Future loadProjectDetails(context,String projectID) async {
    getProjectDetails(context,projectID).listen((res) async {
      profileController.add(res);
      emit(ProjectDetailsDone(projectDetails: res));
    });
  }
  @override
  Future<void> close() async {
    await profileController.close();
    return super.close();
  }

  initProjectDetailCubit() {
    emit(ProjectDetailsInitial());
  }
}