import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/features/feature_password_managment/cubit/edit_account_cubit/edit_account_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/data/model/accounts_model.dart';
import 'package:trudo/features/feature_password_managment/presentation/screen/edit_bottom_sheet.dart';



class EditAccountController {
  final AccountModel accountModel;
  TextEditingController urlController = TextEditingController(text: "");
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String url = "";
  String name = "";
  String password = "";

  EditAccountController({required this.accountModel}) {
    _init();
  }

  void _init() {
    urlController.text = accountModel.url ?? "";
    nameController.text = accountModel.name ?? "";
    passwordController.text = accountModel.password ?? "";
  }

  validateEmptyField(value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  saveUrl(value) {
    url = value!;
  }

  saveName(value) {
    name = value!;
  }

  savePassword(value) {
    password = value!;
  }

  editCategoryRequest(BuildContext context, String id) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context
          .read<EditAccountCubit>()
          .editAccountMethod(context, id)
          .then((value) {
        Navigator.pop(context);
      });
    }
  }

  void dispose() {
    nameController.dispose();
    urlController.dispose();
    passwordController.dispose();
  }

  editCategoryBottomSheet(AccountModel account, BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColor.lightblack,
        builder: (context) {
          return BlocProvider(
            create: (context) => EditAccountCubit(),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: EditCategoryBottomSheet(account: account),
            ),
          );
        });
  }
}
