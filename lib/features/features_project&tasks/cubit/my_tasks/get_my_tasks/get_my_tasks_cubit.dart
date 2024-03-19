import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/functions/get_header_for_requests.dart';
import 'package:trudo/features/features_project&tasks/cubit/my_tasks/get_my_tasks/get_my_tasks_state.dart';
import 'package:trudo/features/features_project&tasks/data/model/maytaskmodel.dart';
import 'package:trudo/widget/show_message.dart';


class GetMyTasksCubit extends Cubit<MyTaskState> {
  GetMyTasksCubit() : super(MyTaskInitial());

  Future<void> getMyTasks(BuildContext context) async {
    const url = "$baseUrl/cards";

    try {
      emit(MyTaskLoading());

      final response = await http.get(Uri.parse(url), headers: getHeader(HeaderType.withToken));
      log("response.statusCode getProjects ${response.statusCode.toString()}");

      if (response.statusCode == 200) {
        log("response.statusCode get Projects ${(response.body)}");
        final myTaskList = myTaskModelFromJson(response.body);
        emit(MyTaskDone(myTask: myTaskList));
      } else if (response.statusCode == 401) {
        showMessage(unAuthorizedMessage, true);
      }
    } catch (err) {
      log("error Projects Data source $err");
      emit(MyTaskFailure());
    }
  }
}
 