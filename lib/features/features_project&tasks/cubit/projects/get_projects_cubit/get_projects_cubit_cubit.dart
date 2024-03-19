import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_cubit/get_projects_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/data/model/projects_model.dart';
import 'package:trudo/widget/show_message.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(ProjectsInitial());

  Future<void> getProjects(BuildContext context) async {
    const url = "$baseUrl/projects";

    try {
      emit(ProjectsLoading());

      // ignore: unused_local_variable
      UserInformationProvider? userInformationProvider;
      userInformationProvider =
          Provider.of<UserInformationProvider>(context, listen: false);

      Map<String, String> header = {
        HttpHeaders.authorizationHeader:
            'Bearer ${userInformationProvider.userHiveModel.accessToken}'
      };
      final response = await get(Uri.parse(url), headers: header);
      log("response.statusCode getProjects ${response.statusCode.toString()}");

      if (response.statusCode == 200) {
        log("response.statusCode get Projects ${(response.body)}");
        emit(ProjectsDone(projects: projectsModelFromJson(response.body)));
      } else if (response.statusCode == 401) {
        showMessage(unAuthorizedMessage, true);
      }
    } catch (err) {
      log("error Projects Data source $err");
      emit(ProjectsFailure());
    }
  }

  Future<bool> addProjects(String title, String description) async {
    const url = "$baseUrl/projects";

    try {
      final body = {
        "title": title,
        "description": description,
        "image": "https://link.com"
      };

      final response = await post(Uri.parse(url), body: body);
      log("response.statusCode addProjects ${response.statusCode.toString()}");

      if (response.statusCode == 200) {
        log("response. add project  ${(response.body)}");

        return true;
      } else if (response.statusCode == 401) {
        showMessage(unAuthorizedMessage, true);
        return false;
      } else {
        log(" failure add project");
        return false;
      }
    } catch (err) {
      log("error add project $err");
      return false;
    }
  }
}
