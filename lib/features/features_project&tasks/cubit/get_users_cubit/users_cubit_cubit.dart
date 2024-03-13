import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/features/features_project&tasks/data/model/all_users_model.dart';
import 'package:trudo/features/features_project&tasks/cubit/get_users_cubit/users_cubit_state.dart';
import 'package:trudo/widget/show_message.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit() : super(AllUsersInitial());

  // Future<void> getAllUsers(BuildContext context) async {
  //   UserInformationProvider? userInformationProvider;
  //   userInformationProvider =
  //       Provider.of<UserInformationProvider>(context, listen: false);
  //   const url = "$baseUrl/users";

  //   try {
  //     Map<String, String> header = {
  //       HttpHeaders.authorizationHeader:
  //           'Bearer ${userInformationProvider.userHiveModel.accessToken}'
  //     };
  //     final response = await http.get(Uri.parse(url), headers: header);
  //     log("response.statusCode Users ${response.statusCode.toString()}");

  //     if (response.statusCode == 200) {
  //       emit(AllUsersDone(users: allUsersModelFromJson(response.body)));
  //     }
  //     if (response.statusCode == 401) {
  //       showMessage(unAuthorizedMessage, true);
  //     }
  //   } catch (err) {
  //     log("error Users Data source $err");
  //     emit(AllUsersFailure());
  //   }
  // }
  Future<void> getAllUsers(BuildContext context) async {
    UserInformationProvider? userInformationProvider;
    userInformationProvider =
        Provider.of<UserInformationProvider>(context, listen: false);
    const url = "$baseUrl/users";

    try {
      Map<String, String> header = {
        HttpHeaders.authorizationHeader:
            'Bearer ${userInformationProvider.userHiveModel.accessToken}'
      };
      final response = await http.get(Uri.parse(url), headers: header);
      log("response.statusCode Users ${response.statusCode.toString()}");

      if (response.statusCode == 200) {
       
        List<AllUsersModel> allUsers = allUsersModelFromJson(response.body);

        
        List<AllUsersModel> activeUsers =
            allUsers.where((user) => user.active == true).toList();

        
        emit(AllUsersDone(users: activeUsers));
      }
      if (response.statusCode == 401) {
        showMessage(unAuthorizedMessage, true);
      }
    } catch (err) {
      log("error Users Data source $err");
      emit(AllUsersFailure());
    }
  }
}
