import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_cubit/get_projects_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_cubit/get_projects_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_tasks_cubit/projects_tasks_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/projects_card.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: AddProject(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const AddProjectButtomSheet();
                    },
                  );
                },
              ),
            ),
            const Divider(
              color: AppColor.grifortext,
              thickness: 0.3,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Filter(),
            ),
            const Divider(
              color: AppColor.grifortext,
              thickness: 0.3,
            ),
            Expanded(
              child: BlocBuilder<ProjectsCubit, ProjectsState>(
                builder: (context, state) {
                  if (state is ProjectsLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColor.primarycolor,
                    ));
                  }
                  if (state is ProjectsDone) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.projects.length,
                            itemBuilder: (BuildContext context, int index) {
                              final project = state.projects[index];
                              return InkWell(
                                  onTap: () {
                                    context
                                        .read<ProjectDetailsCubit>()
                                        .initProjectDetailCubit();
                                    // context
                                    //     .read<AddTaskCubit>()
                                    //     .setProject(project.id!);
                                    context
                                        .read<ProjectDetailsCubit>()
                                        .loadProjectDetails(
                                            context, project.id!);

                                    context.push(
                                        AppRoutes.projectTaskDetailsScreen,
                                        extra: project);
                                  },
                                  child: ProjectsCard(
                                    projectsModel: state.projects[index],
                                  ));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ));
  }
}

class EditProjectButtomSheet extends StatelessWidget {
  const EditProjectButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: const BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel',
                        style: poppinsMediumNormal.copyWith(
                            color: AppColor.primarycolor)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Save',
                        style: poppinsMediumNormal.copyWith(
                            color: AppColor.primarycolor)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: AppColor.backgroundcolor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.photo_camera,
                  color: const Color(0x3EFFFFFF).withOpacity(0.2),
                  size: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                style: const TextStyle(color: AppColor.purple),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
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
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: AppColor.purple),
                      decoration: InputDecoration(
                        hintText: 'Start Date',
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
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: AppColor.purple),
                      decoration: InputDecoration(
                        hintText: 'End Date',
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
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                style: const TextStyle(color: AppColor.purple),
                decoration: InputDecoration(
                  hintText: 'Description ... ',
                  hintStyle:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
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
              child: DropdownButtonFormField<String>(
                style: const TextStyle(color: AppColor.grifortext),
                decoration: InputDecoration(
                  hintText: 'Categories',
                  hintStyle:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
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
                value: 'General',
                onChanged: (String? newValue) {},
                items: <String>[
                  'General',
                  'Development',
                  'Desgin',
                  'Marketing',
                  'Other',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AddProjectButtomSheet extends StatelessWidget {
  const AddProjectButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: const BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel',
                        style: poppinsMediumNormal.copyWith(
                            color: AppColor.primarycolor)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Save',
                        style: poppinsMediumNormal.copyWith(
                            color: AppColor.primarycolor)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: AppColor.backgroundcolor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.photo_camera,
                  color: const Color(0x3EFFFFFF).withOpacity(0.2),
                  size: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                style: const TextStyle(color: AppColor.purple),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
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
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: AppColor.purple),
                      decoration: InputDecoration(
                        hintText: 'Start Date',
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
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: AppColor.purple),
                      decoration: InputDecoration(
                        hintText: 'End Date',
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
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                style: const TextStyle(color: AppColor.purple),
                decoration: InputDecoration(
                  hintText: 'Description ... ',
                  hintStyle:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
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
              child: DropdownButtonFormField<String>(
                style: const TextStyle(color: AppColor.grifortext),
                decoration: InputDecoration(
                  hintText: 'End Date',
                  hintStyle:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
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
                value: 'General',
                onChanged: (String? newValue) {},
                items: <String>[
                  'General',
                  'Development',
                  'Desgin',
                  'Marketing',
                  'Other',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AddProject extends StatelessWidget {
  const AddProject({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final userInformationProvider = context.read<UserInformationProvider>();
    String userNameInitials = userInformationProvider.userName.isNotEmpty
        ? userInformationProvider.userName[0].toUpperCase()
        : "";
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFC18F04),
          radius: 18,
          child: Text(userNameInitials),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          userInformationProvider.userName,
          style: poppinsMediumSmall.copyWith(color: AppColor.purple),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.add,
            color: AppColor.primarycolor,
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Text('Filter',
              style: poppinsMediumSmall.copyWith(
                  color: AppColor.purple, fontSize: 15)),
          const Spacer(),
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Adjust the corner radius as needed
                // You can add a border if desired
              ),
              icon: const FaIcon(
                FontAwesomeIcons.filter,
                color: AppColor.purple,
                size: 15,
              ),
              color: AppColor.white,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("All projects",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("Marketing",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("Development",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("Design",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                  ])
        ],
      ),
    );
  }
}
