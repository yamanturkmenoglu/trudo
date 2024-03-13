import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/features_project&tasks/cubit/edit_add_task_cubit/edit_add_task_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/edit_add_task_cubit/edit_add_task_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/cubit/get_projects_tasks_cubit/projects_tasks_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/get_users_cubit/users_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/get_users_cubit/users_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/data/model/all_users_model.dart';
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart'
    // ignore: library_prefixes
    as ProjectDetailsModel;
import 'package:trudo/features/features_project&tasks/presentation/widget/date_picker_example.dart';

class TaskOverViewScreen extends StatefulWidget {
  final ProjectDetailsModel.Card card;
  const TaskOverViewScreen({super.key, required this.card});

  @override
  State<TaskOverViewScreen> createState() => _TaskOverViewScreenState();
}

class _TaskOverViewScreenState extends State<TaskOverViewScreen> {
  final ValueNotifier<String> _dropdownValue = ValueNotifier<String>("Low");

  var items = [
    'Low',
    'Normal',
    'High',
  ];
  String searchText = '';
  String searchCards = '';
  // List<bool> isChecked = [];
  bool isChecked = false;
  // ignore: unused_field
  late List<AllUsersModel> _users;
  // ignore: unused_field
  String _selectedUserId = "";
  List<AllUsersModel> selectedUsers = [];
  List<ProjectDetailsModel.Card> selectedCards = [];
  List<ProjectDetailsModel.Card>? filteredCards;
  TextEditingController titleEditingController =
      TextEditingController(text: "");
  TextEditingController descriptionEditingController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    titleEditingController.text = widget.card.name ?? "";
    descriptionEditingController.text = widget.card.description ?? "-";
    _dropdownValue.value = widget.card.priority == 0
        ? "Low"
        : widget.card.priority == 1
            ? "Normal"
            : "High";
    context.read<AddTaskCubit>().setName(widget.card.name!);
    context.read<AddTaskCubit>().setDescription(widget.card.description ?? "");
    context.read<AddTaskCubit>().setPriority(widget.card.priority!);
    context.read<AddTaskCubit>().setAssignedTo(widget.card.assignedTo!);
    context.read<AddTaskCubit>().setDependencies(widget.card.dependencies!);
    context
        .read<AddTaskCubit>()
        .setDueDate(widget.card.dueDate ?? DateTime.now().toIso8601String());
    _selectedUserId = widget.card.assignedTo!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    controller: titleEditingController,
                    onChanged: (String value) {
                      context.read<AddTaskCubit>().setName(value);
                    },
                    style: const TextStyle(color: AppColor.purple),
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: poppinsMediumNormal.copyWith(
                          color: AppColor.grifortext),
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
                            color: AppColor.primarycolor.withOpacity(0.4)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    controller: descriptionEditingController,
                    onChanged: (String value) {
                      context.read<AddTaskCubit>().setDescription(value);
                    },
                    style: const TextStyle(color: AppColor.purple),
                    decoration: InputDecoration(
                      hintText: 'Description ... ',
                      hintStyle: poppinsMediumNormal.copyWith(
                          color: AppColor.grifortext),
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
                            color: AppColor.primarycolor.withOpacity(0.4)),
                      ),
                    ),
                    maxLines: 5,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Priority',
                      style:
                          poppinsSemiBoldLarge.copyWith(color: AppColor.purple),
                    )),
                const SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                //   child: DropdownButtonFormField<String>(
                //     style: const TextStyle(color: AppColor.grifortext),
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                //       focusColor: AppColor.primarycolor,
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: BorderSide.none,
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: BorderSide(
                //             color: AppColor.primarycolor.withOpacity(0.4)),
                //       ),
                //     ),
                //     value: 'Normal',
                //     onChanged: (String? newValue) {},
                //     items: <String>[
                //       'Normal',
                //       'High',
                //       'Low',
                //     ].map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(value),
                //       );
                //     }).toList(),
                //   ),
                // ),
                ValueListenableBuilder<String>(
                    valueListenable: _dropdownValue,
                    builder: (context, String dropDown, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: dropDown == "Low"
                                      ? Colors.green.withOpacity(0.5)
                                      : dropDown == "Normal"
                                          ? Colors.grey.withOpacity(0.5)
                                          : Colors.red.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  //  border: Border.all(color: Colors.transparent)
                                ),
                                child: DropdownButton(
                                  value: dropDown,
                                  underline: const SizedBox(),
                                  isExpanded: true,
                                  dropdownColor:
                                      const Color.fromARGB(255, 51, 49, 49),
                                  icon: Container(),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                "  $items",
                                                style: poppinsMediumNormal
                                                    .copyWith(
                                                        color: AppColor.purple),
                                              ),
                                            ),
                                            items == "Low"
                                                ? const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8.0),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      size: 20,
                                                      color: Colors.green,
                                                    ),
                                                  )
                                                : items == "Normal"
                                                    ? const Text("-   ")
                                                    : const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 8.0),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_upward_rounded,
                                                          size: 20,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                          ]),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    _dropdownValue.value = newValue!;

                                    context
                                        .read<AddTaskCubit>()
                                        .setPriority(newValue == "Low"
                                            ? 0
                                            : newValue == "Normal"
                                                ? 1
                                                : 2);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Assigned To',
                      style:
                          poppinsSemiBoldLarge.copyWith(color: AppColor.purple),
                    )),
                const SizedBox(height: 10),
                // BlocBuilder<AllUsersCubit, AllUsersState>(
                //   builder: (context, state) {
                //     if (state is AllUsersInitial || state is AllUsersLoading) {
                //       return const CircularProgressIndicator();
                //     } else if (state is AllUsersDone) {
                //       return Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 15.0),
                //         child: DropdownButtonFormField<AllUsersModel>(
                //           style: const TextStyle(color: AppColor.grifortext),
                //           decoration: InputDecoration(
                //             filled: true,
                //             fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                //             focusColor: AppColor.primarycolor,
                //             enabledBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide: BorderSide.none,
                //             ),
                //             focusedBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide: BorderSide(
                //                   color: AppColor.primarycolor.withOpacity(0.4)),
                //             ),
                //           ),
                //           value: state.users.isNotEmpty ? state.users[0] : null,
                //           onChanged: (AllUsersModel? newValue) {
                //             log("newValue ${newValue?.id}");
                //             context
                //                 .read<AddTaskCubit>()
                //                 .setAssignedTo(newValue!.id!);
                //           },
                //           items: state.users.map((user) {
                //             return DropdownMenuItem<AllUsersModel>(
                //               value: user,
                //               child: Text('${user.firstName} ${user.lastName}'),
                //             );
                //           }).toList(),
                //         ),
                //       );
                //     } else {
                //       return const Text('An error occurred');
                //     }
                //   },
                // ),
                BlocBuilder<AllUsersCubit, AllUsersState>(
                  builder: (context, state) {
                    if (state is AllUsersInitial || state is AllUsersLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is AllUsersDone) {
                      // Find the assigned user model from the list of users
                      AllUsersModel? assignedUser;
                      if (state.users.isNotEmpty &&
                          widget.card.assignedTo != null) {
                        assignedUser = state.users.firstWhere(
                          (user) => user.id == widget.card.assignedTo,
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DropdownButtonFormField<AllUsersModel>(
                          style: const TextStyle(color: AppColor.grifortext),
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
                                  color:
                                      AppColor.primarycolor.withOpacity(0.4)),
                            ),
                          ),
                          value: assignedUser,
                          onChanged: (AllUsersModel? newValue) {
                            log("newValue ${newValue?.id}");
                            context
                                .read<AddTaskCubit>()
                                .setAssignedTo(newValue!.id!);
                          },
                          items: state.users.map((user) {
                            return DropdownMenuItem<AllUsersModel>(
                              value: user,
                              child: Text('${user.firstName} ${user.lastName}'),
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return const Text('An error occurred');
                    }
                  },
                ),

                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DatePickerExample(
                        initialDate: widget.card.updatedAt ?? DateTime.now(),
                      ),
                      BlocBuilder<AddTaskCubit, AddTaskState>(
                        builder: (context2, stateShippingInCustom) {
                          if (stateShippingInCustom.statusAddCard ==
                                  StatusAddCard.loading ||
                              stateShippingInCustom.statusAddCard ==
                                  StatusAddCard.submitting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.primarycolor,
                              ),
                            );
                          }
                          if (stateShippingInCustom.statusAddCard ==
                                  StatusAddCard.initial ||
                              stateShippingInCustom.statusAddCard ==
                                  StatusAddCard.error ||
                              stateShippingInCustom.statusAddCard ==
                                  StatusAddCard.updateDoneAndUpgrade) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  context
                                      .read<AddTaskCubit>()
                                      .setProject(widget.card.project!);
                                  if (stateShippingInCustom.statusAddCard !=
                                      StatusAddCard.updateDoneAndUpgrade) {
                                    context
                                        .read<AddTaskCubit>()
                                        .editTask(
                                            context: context,
                                            taskId: widget.card.id)
                                        .then((value) {
                                      context
                                          .read<ProjectDetailsCubit>()
                                          .loadProjectDetails(
                                              context, widget.card.project!)
                                          .then((value) {
                                        Navigator.pop(context);
                                      });
                                    });
                                  } else if (stateShippingInCustom
                                          .statusAddCard ==
                                      StatusAddCard.updateDoneAndUpgrade) {}
                                },
                                icon: const Icon(Icons.done),
                                label: Text(
                                    stateShippingInCustom.statusAddCard !=
                                            StatusAddCard.updateDoneAndUpgrade
                                        ? "Save"
                                        : "Done"),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      const Color(0x3EFFFFFF).withOpacity(0.2),
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
