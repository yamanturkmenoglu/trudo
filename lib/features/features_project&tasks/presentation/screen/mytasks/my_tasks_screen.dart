// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/features/feature_password_managment/presentation/widget/password_mang_appbar.dart';
import 'package:trudo/features/features_project&tasks/cubit/my_tasks/get_my_tasks/get_my_tasks_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/my_tasks/get_my_tasks/get_my_tasks_state.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_cubit/get_projects_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_cubit/get_projects_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/custom_text_form_field.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/my_task_card.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({
    super.key,
  });

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  final ValueNotifier<bool> isSearchContainerVisible = ValueNotifier(false);

  final ValueNotifier<String?> _selectedCategoryNotifier =
      ValueNotifier<String?>(null);
  late String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    final userInformationProvider = context.read<UserInformationProvider>();
    return Scaffold(
        backgroundColor: AppColor.black,
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 70),
            PassWordMangAppBar(
              onPressed: () {
                isSearchContainerVisible.value =
                    !isSearchContainerVisible.value;
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
                                setState(() {
                                  _searchValue = value;
                                });
                              },
                              hintStyle:
                                  const TextStyle(color: AppColor.grifortext),
                              hintText: 'Search Task',
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
                        child: BlocBuilder<ProjectsCubit, ProjectsState>(
                          builder: (context, state) {
                            if (state is ProjectsDone) {
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
                                    state.projects.map((category) {
                                  return PopupMenuItem(
                                    onTap: () {
                                      _selectedCategoryNotifier.value =
                                          category.id;
                                    },
                                    child: Text(
                                      category.title ?? '',
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
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<GetMyTasksCubit, MyTaskState>(
              builder: (context, state) {
                if (state is MyTaskLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primarycolor,
                    ),
                  );
                }
                if (state is MyTaskDone) {
                  final userId = userInformationProvider.userId;
                  final userTasks = state.myTask.where((task) {
                    bool isAssignedToUser = task.assignedTo == userId;
                    bool hasActionAssignedToUser =
                        task.actions!.any((action) => action.user == userId);

                    return (isAssignedToUser || hasActionAssignedToUser) &&
                        task.name!
                            .toLowerCase()
                            .contains(_searchValue.toLowerCase());
                  }).toList();

                  print('Filtered task count: ${userTasks.length}');

                  for (var task in userTasks) {
                    print(
                        'Task ID: ${task.id}, Assigned User: ${task.assignedTo}');
                  }

                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: userTasks.length,
                      itemBuilder: (context, index) {
                        final task = userTasks[index];
                        return MyTaskCard(
                          onTap: () {},
                          myTaskModel: task,
                        );
                      },
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ]),
        ));
  }
}
