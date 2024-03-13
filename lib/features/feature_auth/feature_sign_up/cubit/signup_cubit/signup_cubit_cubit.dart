import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/cubit/signup_cubit/signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());

  setName(String name) {
    emit(state.copyWith(name: name, status: Status.initial));
  }

  setLastName(String lastName) {
    emit(state.copyWith(lastName: lastName, status: Status.initial));
  }

  setEmail(String email) {
    emit(state.copyWith(email: email, status: Status.initial));
  }

  setPassword(String password) {
    emit(state.copyWith(password: password, status: Status.initial));
  }

  setConfirmPassword(String confirmPassword) {
    emit(state.copyWith(
        confirmPassword: confirmPassword, status: Status.initial));
  }

  setRole(String role) {
    emit(state.copyWith(role: role, status: Status.initial));
  }

  setPhoneNumber(String phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber, status: Status.initial));
  }

  setDateOfBirth(String dateOfBirth) {
    emit(state.copyWith(dateOfBirth: dateOfBirth, status: Status.initial));
  }

  Future<void> signupWithCredentials({required BuildContext context}) async {
    emit(state.copyWith(status: Status.loading));

    if (state.status == Status.submitting) return;
    emit(state.copyWith(status: Status.submitting));

    try {
      Map<String, String> header = {"Content-Type": "application/json"};

      final signupBody = jsonEncode({
        "firstName": state.name,
        "lastName": state.lastName,
        "email": state.email,
        "phoneNumber": state.phoneNumber,
        "password": state.password,
        "birthDate": "02.01.2023",
        "roles": [state.role.toLowerCase() == "personal" ? "user" : "user"],
      });
      log(" response sign up $signupBody");

      final response = await http.post(Uri.parse("$baseUrl/users/signup"),
          body: signupBody, headers: header);

      log(" response sign up ${response.statusCode}  ${response.body}");

      if (response.statusCode == 200) {
        emit(state.copyWith(status: Status.success));
        log(" ${response.statusCode} response sign up");
      } else {
        emit(state.copyWith(status: Status.error));
      }
    } catch (_) {
      emit(state.copyWith(status: Status.error));
      throw "__ $_";
    }
  }
}
