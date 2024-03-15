import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/functions/get_header_for_requests.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_all_accounts_cubit/get_all_accounts_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/data/model/accounts_model.dart';
import 'package:trudo/widget/show_message.dart';

class AllAccountsCubit extends Cubit<AllAccountsState> {
  AllAccountsCubit() : super(AllAccountsInitial());

  List<AccountModel> allAccounts = [];

  Future<void> getAllAccounts() async {
    emit(AllAccountsLoading());
    const url = "$baseUrl/passwords";

    try {
      final response =
          await get(Uri.parse(url), headers: getHeader(HeaderType.withToken));

      if (response.statusCode == 200) {
        log("response.statusCode get Accuont ${(response.body)}");
        allAccounts = accountModelFromJson(response.body);
        emit(AllAccountsDone(account: accountModelFromJson(response.body)));
      }
      if (response.statusCode == 401) {
        showMessage(unAuthorizedMessage, true);
      }
    } catch (err) {
      log(err.toString());
      emit(AllAccountsFailure());
    }
  }

  void filterAccount(String filter) {
    if (filter.isEmpty) {
      emit(AllAccountsDone(account: allAccounts));
    } else {
      emit(AllAccountsDone(
          account: allAccounts
              .where((supplier) =>
                  supplier.name!.toLowerCase().contains(filter.toLowerCase()))
              .toList()));
    }
  }
  void addAccount(AccountModel newaccount) {
    final currentState = state;
    if (currentState is AllAccountsDone) {
      final updatedAccount =
          List<AccountModel>.from(currentState.account)..add(newaccount);
      emit(AllAccountsDone(account: updatedAccount));
    }
  }

}
