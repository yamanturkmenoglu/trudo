import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_users_cubit/users_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_users_cubit/users_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/data/model/all_users_model.dart';
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart'
    // ignore: library_prefixes
    as ProjectDetailsModel;
import 'package:trudo/features/features_project&tasks/presentation/processing/find_user.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.card,
    required this.onTap,
  }) : super(key: key);
  final ProjectDetailsModel.Card card;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.backgroundcolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title: Text(card.name ?? '',
                    style:
                        poppinsMediumNormal.copyWith(color: AppColor.purple)),
                trailing: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Text(
                          card.description ?? "",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.purple, fontSize: 10),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(193, 81, 79, 79),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.file_present,
                              color: AppColor.purple,
                            ),
                            title: Text('Files',
                                style: poppinsMediumNormal.copyWith(
                                    color: AppColor.purple, fontSize: 14)),
                            trailing: Text(card.files?.length.toString() ?? "",
                                style: poppinsMediumSmall.copyWith(
                                    color: AppColor.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(193, 81, 79, 79),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.comment,
                              color: AppColor.purple,
                            ),
                            title: Text('Comments',
                                style: poppinsMediumNormal.copyWith(
                                    color: AppColor.purple, fontSize: 14)),
                            trailing: Text(
                                card.comments?.length.toString() ?? "",
                                style: poppinsMediumSmall.copyWith(
                                    color: AppColor.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(193, 81, 79, 79),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.task,
                              color: AppColor.purple,
                            ),
                            title: Text('Subtask',
                                style: poppinsMediumNormal.copyWith(
                                    color: AppColor.purple, fontSize: 14)),
                            trailing: Text(
                                card.subTasks?.length.toString() ?? "",
                                style: poppinsMediumSmall.copyWith(
                                    color: AppColor.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<AllUsersCubit, AllUsersState>(
                          builder: (context, state) {
                            if (state is AllUsersDone) {
                              AllUsersModel? user =
                                  findUser(state.users, card.assignedTo!);
                              return user == null
                                  ? const SizedBox()
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            193, 81, 79, 79),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.person,
                                          color: AppColor.purple,
                                        ),
                                        title: Text(
                                            '${user.firstName} ${user.lastName}',
                                            style: poppinsMediumNormal.copyWith(
                                                color: AppColor.purple,
                                                fontSize: 14)),
                                        trailing: Text(
                                          card.updatedAt
                                              .toString()
                                              .substring(0, 10),
                                          style: poppinsMediumSmall.copyWith(
                                            color: const Color(0xFFEB1414),
                                          ),
                                        ),
                                      ),
                                    );
                            }
                            return const SizedBox();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
