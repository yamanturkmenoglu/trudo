import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/custom_page_transition.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/task_action_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/task_comment_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/task_files_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/task_overview_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/task_subtask_screen.dart';
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart'
    as ProjectDetailsModel;

class TaskDetailsScreen extends StatefulWidget {
  final List<ProjectDetailsModel.Card> cards;
  final ProjectDetailsModel.Card card;

  static PageTransition builder(BuildContext context, GoRouterState state) {
    final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
    List<ProjectDetailsModel.Card> cards = args['param1'];
    ProjectDetailsModel.Card card = args['param2'];
    return PageTransition(
      page: TaskDetailsScreen(cards: cards, card: card),
      state: state,
    );
  }

  const TaskDetailsScreen({Key? key, required this.cards, required this.card})
      : super(key: key);

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Text(
          'Task name',
          style: poppinsMediumNormal.copyWith(color: AppColor.purple),
        ),
        iconTheme: const IconThemeData(color: AppColor.purple),
      ),
      body: Column(
        children: [
          const Divider(
            color: AppColor.grifortext,
            thickness: 0.3,
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Over View'),
              Tab(text: 'Subtasks'),
              Tab(text: 'Files'),
              Tab(text: 'Comments'),
              Tab(text: 'Action'),
            ],
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            dividerColor: Colors.transparent,
            indicatorColor: AppColor.purple,
            labelColor: AppColor.purple,
            unselectedLabelColor: AppColor.grifortext,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // overview Page
                TaskOverViewScreen(
                  card: widget.card,
                ),
                // SubTas Page
                const TaskSubTaskScreen(),
                // files Page
                const TaskFilesScreen(),
                // Comment Page
                const TaskCommentScreen(),
                // Action Page
                const TaskActionScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
