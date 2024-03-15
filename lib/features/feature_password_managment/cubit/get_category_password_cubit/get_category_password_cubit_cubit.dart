import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_category_password_cubit/get_category_password_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/data/model/all_password_category_model.dart';
import 'package:trudo/widget/show_message.dart';

class AllCategoryCubit extends Cubit<AllCategoryState> {
  AllCategoryCubit() : super(AllCategoryInitial());

  Future<void> getAllCategory(BuildContext context) async {
    UserInformationProvider? userInformationProvider;
    userInformationProvider =
        Provider.of<UserInformationProvider>(context, listen: false);
    const url = "$baseUrl/password-category";

    try {
      Map<String, String> header = {
        HttpHeaders.authorizationHeader:
            'Bearer ${userInformationProvider.userHiveModel.accessToken}'
      };
      final response = await http.get(Uri.parse(url), headers: header);
      log("response.statusCode category ${response.statusCode.toString()}");

      if (response.statusCode == 200) {
        List<AllPasswordCategoryModel> allcategory =
            allPasswordCategoryModelFromJson(response.body);

        emit(AllCategoryDone(category: allcategory));
      }
      if (response.statusCode == 401) {
        showMessage(unAuthorizedMessage, true);
      }
    } catch (err) {
      log("error Users Data source $err");
      emit(AllCategoryFailure());
    }
  }
}
