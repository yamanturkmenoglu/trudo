import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/feature_password_managment/cubit/edit_account_cubit/edit_account_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/edit_account_cubit/edit_account_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_category_password_cubit/get_category_password_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_category_password_cubit/get_category_password_cubit_state.dart';

import 'package:trudo/features/feature_password_managment/data/model/accounts_model.dart';
import 'package:trudo/features/feature_password_managment/data/model/add_account_model.dart';
import 'package:trudo/features/feature_password_managment/data/model/all_password_category_model.dart';
import 'package:trudo/features/feature_password_managment/presentation/processing/edit_account_controller.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/custom_text_form_field.dart';
import 'package:trudo/widget/custom_button_widget.dart';

class EditCategoryBottomSheet extends StatefulWidget {
  final AccountModel account;

  const EditCategoryBottomSheet({required this.account, super.key});

  @override
  State<EditCategoryBottomSheet> createState() =>
      _EditCategoryBottomSheetState();
}

class _EditCategoryBottomSheetState extends State<EditCategoryBottomSheet> {
  late EditAccountController _controller;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();

    _controller = EditAccountController(accountModel: widget.account);
    initCubit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColor.lightblack,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Url",
                  style: poppinsMediumSmall.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextFormField(
                  textEditingController: _controller.urlController,
                  style:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
                  onChange: (value) {
                    context
                        .read<EditAccountCubit>()
                        .setAccount(AddAccountModel(url: value));
                  },
                  validator: (value) => _controller.validateEmptyField(value),
                  onSave: (value) => _controller.saveUrl(value),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Account Name",
                  style: poppinsMediumSmall.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextFormField(
                  textEditingController: _controller.nameController,
                  style:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
                  onChange: (value) {
                    context
                        .read<EditAccountCubit>()
                        .setAccount(AddAccountModel(name: value));
                  },
                  validator: (value) => _controller.validateEmptyField(value),
                  onSave: (value) => _controller.saveName(value),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Parent",
                  style: poppinsMediumSmall.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 6,
                ),
                BlocBuilder<AllCategoryCubit, AllCategoryState>(
                  builder: (context, state) {
                    if (state is AllCategoryDone) {
                      AllPasswordCategoryModel? selectedCategory;
                      return DropdownButtonFormField<AllPasswordCategoryModel>(
                        style:
                            poppinsMediumSmall.copyWith(color: AppColor.purple),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                          focusColor: AppColor.primarycolor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColor.primarycolor.withOpacity(0.4),
                            ),
                          ),
                        ),
                        hint: const Text(
                          'Select Category ',
                          style: TextStyle(color: AppColor.grifortext),
                        ),
                        dropdownColor: AppColor.lightblack,
                        value: selectedCategory,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCategory = newValue;
                            _selectedCategory = newValue?.id;
                            context.read<EditAccountCubit>().setAccount(
                                AddAccountModel(category: newValue?.id));
                          });
                          // ignore: avoid_print
                          print(_selectedCategory);
                        },
                        items: state.category
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name ?? ''),
                                ))
                            .toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<EditAccountCubit, EditAccountState>(
                  builder: (context, state) {
                    if (state.status == Status.loading ||
                        state.status == Status.submitting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColor.primarycolor,
                      ));
                    }
                    if (state.status == Status.initial ||
                        state.status == Status.error) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButtonWidget(
                            buttonTitle: "Submit",
                            function: () => _controller.editCategoryRequest(
                                context, widget.account.id!)),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  initCubit() {
    context.read<EditAccountCubit>().setAccount(AddAccountModel(
        url: widget.account.url ?? "",
        name: widget.account.name ?? "",
        password: widget.account.password ?? "",
        category: widget.account.category!.id.toString()));
  }
}
