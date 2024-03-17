import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/functions/get_header_for_requests.dart';
import 'package:trudo/features/feature_password_managment/cubit/edit_account_cubit/edit_account_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_all_accounts_cubit/get_all_accounts_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/data/model/accounts_model.dart';
import 'package:trudo/features/feature_password_managment/data/model/add_account_model.dart';
import 'package:http/http.dart' as http;

class EditAccountCubit extends Cubit<EditAccountState> {
  EditAccountCubit() : super(EditAccountState.initial());

  setAccount(AddAccountModel addAccountModel) {
    emit(state.copyWith(
        addAccountModel: state.addAccountModel.copyWith(
      url: addAccountModel.url,
      name: addAccountModel.name,
      password: addAccountModel.password,
      category: addAccountModel.category,
    )));
  }

  Future<void> editAccountMethod(BuildContext context, String id) async {
    emit(state.copyWith(status: Status.loading));

    if (state.status == Status.submitting) {
      return;
    }
    emit(state.copyWith(status: Status.submitting));

    try {
      final response = await http.put(
        Uri.parse("$baseUrl/passwords/$id"),
        body: state.addAccountModel.toJson(),
        headers: getHeader(HeaderType.withToken),
      );

      log(" response edit account ${jsonEncode(state.addAccountModel.toJson())}  ${response.body}");

      if (response.statusCode == 200) {
        final accountModel = accountsModelFromJson(
            response.body); 
        context.read<AllAccountsCubit>().editAccount(id, accountModel);
        emit(state.copyWith(status: Status.success));
        emit(state.copyWith(status: Status.initial));
        log(" ${response.statusCode} response edit account");
      }
    } catch (_) {
      
      emit(state.copyWith(status: Status.error)); 
      throw "__ $_"; 
    }
  }
}
