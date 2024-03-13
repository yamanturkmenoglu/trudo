

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/features/feature_auth/feature_forgetpassword/cubit/forget_password_cubit/forget_password_cubit_state.dart';
import 'package:trudo/features/feature_auth/feature_forgetpassword/data/model/forget_password_model.dart';


class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordState.initial());

  setEmail(String email) {
    emit(state.copyWith(email: email, status: Status.initial));
  }

  Future<void> forgetPassword(BuildContext context) async {
    emit(state.copyWith(status: Status.loading));

    if (state.status == Status.submitting) return;
    emit(state.copyWith(status: Status.submitting));
    try {
      final forgetPassword = {
        "email": state.email,
      };
      // ignore: avoid_print
      print("try forgetPassword $forgetPassword");

      final response = await http.post(
          Uri.parse("$baseUrl/users/forgot-password"),
          body: forgetPassword);

      // ignore: avoid_print
      print("try ${response.statusCode} ");

      if (response.statusCode == 200) {
        emit(state.copyWith(
            status: Status.success,
            forgetPasswordModel: forgetPasswordModelFromJson(response.body)));
        emit(state.copyWith(status: Status.initial));
      } else {
        emit(state.copyWith(status: Status.error));
      }
    } catch (err) {
      emit(state.copyWith(status: Status.error));

      // ignore: avoid_print
      print("err $err");
    }
  }
}