import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/functions/get_header_for_requests.dart';
import 'package:trudo/features/feature_password_managment/cubit/add_new_account_cubit/add_new_account_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_all_accounts_cubit/get_all_accounts_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/data/model/accounts_model.dart';
import 'package:trudo/features/feature_password_managment/data/model/add_account_model.dart';

class AddNewAccountCubit extends Cubit<AddAccountState> {
  AddNewAccountCubit() : super(AddAccountState.initial());

  setAccount(AddAccountModel addAccountModel) {
    emit(state.copyWith(
        addAccountModel: state.addAccountModel.copyWith(
      url: addAccountModel.url,
      name: addAccountModel.name,
      password: addAccountModel.password,
      category: addAccountModel.category,
    )));
  }

  Future<void> addAccountMethod({required BuildContext context}) async {
    emit(state.copyWith(status: Status.loading));

    if (state.status == Status.submitting) return;
    emit(state.copyWith(status: Status.submitting));
    log(
      state.addAccountModel.toString(),
    );
    try {
      final response = await http.post(Uri.parse("$baseUrl/passwords"),
          body: jsonEncode(state.addAccountModel.toJson()),
          headers: getHeader(HeaderType.withToken));

      log(" response add account ${response.statusCode}  ${response.body}");

      if (response.statusCode == 200) {
        log("accountsModelFromJson(response.body) $accountsModelFromJson(response.body)");
        // ignore: use_build_context_synchronously
        context
            .read<AllAccountsCubit>()
            .addAccount(accountsModelFromJson(response.body));
        emit(state.copyWith(status: Status.success));
        emit(state.copyWith(status: Status.initial));
        log(" ${response.statusCode} response add account");
      } else if (response.statusCode != 200) {
        emit(state.copyWith(status: Status.error));
        log(" ${response.statusCode} response add account");
      }
    } catch (_) {
      emit(state.copyWith(status: Status.error));
      throw "__ $_";
    }
  }
}
