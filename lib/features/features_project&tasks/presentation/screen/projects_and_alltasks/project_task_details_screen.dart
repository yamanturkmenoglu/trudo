import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/features_project&tasks/cubit/edit_add_task_cubit/edit_add_task_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/edit_add_task_cubit/edit_add_task_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/cubit/get_projects_tasks_cubit/projects_tasks_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/get_projects_tasks_cubit/projects_tasks_cubit_state.dart';
// ignore: unused_import
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart'
    // ignore: library_prefixes
    as ProjectModel;
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart';
import 'package:trudo/features/features_project&tasks/data/model/projects_model.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/backlog_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/done_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/review_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/to_do_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/custom_text_form_field.dart';

class ProjectTaskDetailsScreen extends StatefulWidget {
  final ProjectsModel projectsModel;

  const ProjectTaskDetailsScreen({Key? key, required this.projectsModel})
      : super(key: key);

  @override
  State<ProjectTaskDetailsScreen> createState() => _ProjectTaskDetailsState();
}

class _ProjectTaskDetailsState extends State<ProjectTaskDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ProjectDetailsModel? projectDetails;
  List<Tab> tabs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        iconTheme: const IconThemeData(color: AppColor.purple),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.projectsModel.image?.url ??
                    'http://via.placeholder.com/350x150',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
              widget.projectsModel.title ?? '',
              style: poppinsMediumNormal.copyWith(color: AppColor.purple),
            ),
            subtitle: Text(
              widget.projectsModel.description ?? '',
              style: poppinsMediumSmall.copyWith(
                  color: AppColor.grifortext, fontSize: 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              widget.projectsModel.endDate != null &&
                      widget.projectsModel.endDate!.length >= 10
                  ? widget.projectsModel.endDate!.substring(0, 10)
                  : " ",
              style: poppinsMediumSmall.copyWith(
                  color: AppColor.purple, fontSize: 12),
            ),
          ),
          const Divider(
            color: AppColor.grifortext,
            thickness: 0.3,
          ),
          BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
            builder: (context, state) {
              List<String> tabsname = [];

              if (state is ProjectDetailsDone) {
                projectDetails = state.projectDetails;
                for (var element in projectDetails!.lists!) {
                  tabsname.add(element.title!);
                }
                // TabBar oluşturulduktan sonra TabBarView'ın çocuklarını oluştur
                return Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: tabsname[0]),
                        Tab(text: tabsname[1]),
                        Tab(text: tabsname[2]),
                        Tab(text: tabsname[3]),
                      ],
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColor.purple,
                      labelColor: AppColor.purple,
                      unselectedLabelColor: AppColor.grifortext,
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Backlog Page
                          if (projectDetails != null &&
                              projectDetails!.lists != null &&
                              projectDetails!.lists!.isNotEmpty)
                            BackLogScreen(
                                cards: projectDetails!.lists![0].cards),
                          // To Do Page
                          if (projectDetails != null &&
                              projectDetails!.lists != null &&
                              projectDetails!.lists!.length > 1)
                            ToDoScreen(cards: projectDetails!.lists![1].cards),
                          // Review Done Page
                          if (projectDetails != null &&
                              projectDetails!.lists != null &&
                              projectDetails!.lists!.length > 2)
                            ReviewScreen(
                                cards: projectDetails!.lists![2].cards),
                          // Changed Page
                          if (projectDetails != null &&
                              projectDetails!.lists != null &&
                              projectDetails!.lists!.length > 3)
                            DoneScreen(cards: projectDetails!.lists![3].cards),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                contentPadding: EdgeInsets.zero,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: CustomTextFormField(
                        onChange: (String value) {
                          context.read<AddTaskCubit>().setStatus("back_log");
                          context
                              .read<AddTaskCubit>()
                              .setProject(widget.projectsModel.id!);
                          context.read<AddTaskCubit>().setName(value);
                        },
                        hintText: "Enter task name",
                      ),
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<AddTaskCubit, AddTaskState>(
                      builder: (context, state) {
                        if (state.statusAddCard == StatusAddCard.loading ||
                            state.statusAddCard == StatusAddCard.submitting) {
                          return const Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColor.primarycolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }

                        if (state.statusAddCard == StatusAddCard.initial ||
                            state.statusAddCard == StatusAddCard.error) {
                          return Padding(
                              padding: const EdgeInsets.all(8),
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<AddTaskCubit>()
                                        .addTask(context: context)
                                        .then((value) {
                                      context
                                          .read<ProjectDetailsCubit>()
                                          .loadProjectDetails(
                                              context, widget.projectsModel.id!)
                                          .then((value) {
                                        Navigator.pop(context);
                                      });
                                    });
                                  },
                                  icon: const Icon(Icons.done,
                                      color: AppColor.primarycolor, size: 30)));
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
