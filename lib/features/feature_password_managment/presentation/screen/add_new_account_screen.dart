import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/feature_password_managment/cubit/add_new_account_cubit/add_new_account_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/add_new_account_cubit/add_new_account_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_category_password_cubit/get_category_password_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_category_password_cubit/get_category_password_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/data/model/add_account_model.dart';
import 'package:trudo/features/feature_password_managment/data/model/all_password_category_model.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/custom_text_form_field.dart';

class AddNewAccountScreen extends StatefulWidget {
  const AddNewAccountScreen({Key? key}) : super(key: key);

  @override
  _AddNewAccountScreenState createState() => _AddNewAccountScreenState();
}

class _AddNewAccountScreenState extends State<AddNewAccountScreen> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightblack,
        title: Text('Add New Account',
            style: poppinsMediumNormal.copyWith(color: AppColor.purple)),
        actions: [
          BlocBuilder<AddNewAccountCubit, AddAccountState>(
            builder: (context, state) {
              if (state.status == Status.loading ||
                  state.status == Status.submitting) {
                return const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColor.primarycolor,
                    ),
                  ),
                );
              }
              if (state.status == Status.initial ||
                  state.status == Status.error) {
                return IconButton(
                    onPressed: () {
                      context
                          .read<AddNewAccountCubit>()
                          .addAccountMethod(context: context);
                    },
                    icon: const Icon(Icons.done));
              }
              return const SizedBox();
            },
          ),
        ],
        iconTheme: const IconThemeData(color: AppColor.primarycolor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              onEditingComplete: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
              onChange: (value) {
                context
                    .read<AddNewAccountCubit>()
                    .setAccount(AddAccountModel(url: value));
              },
              hintStyle: const TextStyle(color: AppColor.grifortext),
              hintText: 'URL',
              prefixIcon: const Icon(
                Icons.link,
                color: AppColor.grifortext,
                size: 28,
              ),
              style: const TextStyle(color: AppColor.purple, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              cursorColor: AppColor.primarycolor,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFormField(
              onEditingComplete: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
              onChange: (value) {
                context
                    .read<AddNewAccountCubit>()
                    .setAccount(AddAccountModel(name: value));
              },
              hintStyle: const TextStyle(color: AppColor.grifortext),
              hintText: 'Account Name',
              prefixIcon: const Icon(
                Icons.account_box,
                color: AppColor.grifortext,
                size: 28,
              ),
              style: const TextStyle(color: AppColor.purple, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              cursorColor: AppColor.primarycolor,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFormField(
              onEditingComplete: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
              onChange: (value) {
                context
                    .read<AddNewAccountCubit>()
                    .setAccount(AddAccountModel(password: value));
              },
              hintStyle: const TextStyle(color: AppColor.grifortext),
              hintText: 'Password',
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColor.grifortext,
                size: 28,
              ),
              style: const TextStyle(color: AppColor.purple, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              cursorColor: AppColor.primarycolor,
            ),
            const SizedBox(height: 25),
            BlocBuilder<AllCategoryCubit, AllCategoryState>(
              builder: (context, state) {
                if (state is AllCategoryDone) {
                  AllPasswordCategoryModel? selectedCategory;
                  return DropdownButtonFormField<AllPasswordCategoryModel>(
                    style: poppinsMediumSmall.copyWith(color: AppColor.purple),
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
                    dropdownColor: AppColor.lightblack,
                    value: selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue;
                        _selectedCategory = newValue?.id;
                        context.read<AddNewAccountCubit>().setAccount(
                            AddAccountModel(
                                category: _selectedCategory.toString()));
                      });
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
          ],
        ),
      ),
    );
  }
}
