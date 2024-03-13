import 'dart:developer';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/features/feature_auth/feature_check_token/data/model/check_token_model.dart';
import 'package:trudo/widget/show_message.dart';

part 'check_token_state.dart';

class CheckTokenCubit extends Cubit<CheckTokenState> {
  CheckTokenCubit() : super(CheckTokenInitial());


  Future<CheckTokenModel> getCheckToken(BuildContext context) async {
    UserInformationProvider? userInformationProvider;
    userInformationProvider =  Provider.of<UserInformationProvider>(context , listen:  false);
    const url = "$baseUrl/users/check/JWT";

    try {

      Map<String, String> header = {HttpHeaders.authorizationHeader: 'Bearer ${userInformationProvider.userHiveModel.accessToken}'};
      final response = await get(Uri.parse(url),headers: header);
      log("response statusCode getCheckToken ${response.statusCode.toString()}");

      if(response.statusCode == 200) {
        emit(CheckTokenDone(checkToken:  checkTokenModelFromJson(response.body)));
        return checkTokenModelFromJson(response.body);

      }
      if(response.statusCode == 401) {
        showMessage(unAuthorizedMessage, true);
        return  checkTokenModelFromJson(response.body);

      } else {
        emit(CheckTokenFailure());
        return CheckTokenModel();
      }
    } catch (err) {
      log("error getCheckToken  $err");
      emit(CheckTokenFailure());
      return CheckTokenModel();
    }
  }

}