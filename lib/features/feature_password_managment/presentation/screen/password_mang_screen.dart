import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_all_accounts_cubit/get_all_accounts_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_all_accounts_cubit/get_all_accounts_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_category_password_cubit/get_category_password_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_category_password_cubit/get_category_password_cubit_state.dart';
import 'package:trudo/features/feature_password_managment/presentation/processing/edit_account_controller.dart';
import 'package:trudo/features/feature_password_managment/presentation/widget/flatting_button_password.dart';
import 'package:trudo/features/feature_password_managment/presentation/widget/password_mang_appbar.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/custom_text_form_field.dart';

import '../../data/model/accounts_model.dart';

class PasswordMangScreen extends StatefulWidget {
  const PasswordMangScreen({super.key});

  @override
  State<PasswordMangScreen> createState() => _PasswordMangScreenState();
}

class _PasswordMangScreenState extends State<PasswordMangScreen> {
  final ValueNotifier<bool> isSearchContainerVisible = ValueNotifier(false);
  late EditAccountController _controller;
  // ignore: unused_field
  String? _selectedCategory;
  final ValueNotifier<String?> _selectedCategoryNotifier =
      ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    _controller = EditAccountController(accountModel: AccountModel());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          PassWordMangAppBar(
            onPressed: () {
              isSearchContainerVisible.value = !isSearchContainerVisible.value;
            },
          ),
          ValueListenableBuilder(
            valueListenable: isSearchContainerVisible,
            builder: (BuildContext context, bool value, Widget? child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: value ? 60 : 0,
                curve: Curves.easeInOut,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: AppColor.black,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomTextFormField(
                            onEditingComplete: () {
                              setState(() {
                                FocusScope.of(context).unfocus();
                              });
                            },
                            onChange: (value) {
                              context
                                  .read<AllAccountsCubit>()
                                  .filterAccount(value);
                            },
                            hintStyle:
                                const TextStyle(color: AppColor.grifortext),
                            hintText: 'Search Account',
                            prefixIcon: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: isSearchContainerVisible.value ? 1 : 0,
                              child: const Icon(
                                Icons.search,
                                color: AppColor.grifortext,
                                size: 28,
                              ),
                            ),
                            style: const TextStyle(
                                color: AppColor.purple, fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            cursorColor: AppColor.primarycolor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: BlocBuilder<AllCategoryCubit, AllCategoryState>(
                        builder: (context, state) {
                          if (state is AllCategoryDone) {
                            return PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              icon: AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: value ? 1 : 0,
                                child: const Icon(
                                  FontAwesomeIcons.filter,
                                  color: AppColor.grifortext,
                                  size: 24,
                                ),
                              ),
                              color: AppColor.white,
                              itemBuilder: (context) =>
                                  state.category.map((category) {
                                return PopupMenuItem(
                                  onTap: () {
                                    _selectedCategoryNotifier.value =
                                        category.id;
                                  },
                                  child: Text(
                                    category.name ?? '',
                                    style: poppinsMediumSmall.copyWith(
                                        color: AppColor.black),
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          BlocBuilder<AllAccountsCubit, AllAccountsState>(
            builder: (context, state) {
              if (state is AllAccountsDone) {
                return ValueListenableBuilder<String?>(
                  valueListenable: _selectedCategoryNotifier,
                  builder: (context, selectedCategory, child) {
                    final filteredAccounts = selectedCategory != null
                        ? state.account
                            .where((account) =>
                                account.category?.id == selectedCategory)
                            .toList()
                        : state.account;

                    if (filteredAccounts.isEmpty) {
                      // Eğer filtrelenmiş hesaplar listesi boşsa bir widget göster
                      // Bu örnekte Lottie animasyonu kullanıyoruz
                      return Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Center(
                            child: Lottie.asset('assets/images/empty.json'),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: filteredAccounts.length,
                          itemBuilder: (context, index) {
                            final accounts = filteredAccounts[index];
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    backgroundColor: AppColor.backgroundcolor,
                                    onPressed: (context) {
                                      _controller.editCategoryBottomSheet(
                                        accounts,
                                        context,
                                      );
                                    },
                                    icon: Icons.edit,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.lightblack,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ExpansionTile(
                                    backgroundColor: AppColor.lightblack,
                                    tilePadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        'assets/images/null.png',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      accounts.name ?? "",
                                      style: poppinsMediumNormal.copyWith(
                                        color: AppColor.purple,
                                      ),
                                    ),
                                    subtitle: Text(
                                      accounts.category?.name ?? "",
                                      style: poppinsMediumSmall.copyWith(
                                        color: AppColor.grifortext,
                                      ),
                                    ),
                                    trailing: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColor.primarycolor,
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  FontAwesomeIcons.link,
                                                  color: AppColor.primarycolor,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  " ${accounts.url}",
                                                  style: poppinsMediumSmall
                                                      .copyWith(
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 10.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    FontAwesomeIcons.lock,
                                                    color:
                                                        AppColor.primarycolor,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    " ${accounts.password}",
                                                    style: poppinsMediumSmall
                                                        .copyWith(
                                                      color: AppColor.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonPassword(
        onTapAddAction: () {
          context.push(AppRoutes.addpasswordScreen);
        },
      ),
    );
  }
}
