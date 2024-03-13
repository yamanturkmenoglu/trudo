import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/features/feature_home/cubit/navbar_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/get_projects_cubit/get_projects_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/mytasks/my_tasks_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/project_screen.dart';
import 'package:trudo/widget/custtom_bottomnavbar_botton.dart';

class ProjectMainScreen extends StatelessWidget {
  const ProjectMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentPage) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: BottomAppBar(
              height: 70,
              elevation: 0,
              color: AppColor.lightblack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomBottomNavBar(
                      onPressed: () {
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .changePage(0);
                      },
                      titel: "Projects",
                      icondata: FontAwesomeIcons.diagramProject,
                      active: currentPage == 0,
                    ),
                  ),
                  Expanded(
                    child: CustomBottomNavBar(
                      onPressed: () {
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .changePage(1);
                      },
                      titel: "My Tasks",
                      // ignore: deprecated_member_use
                      icondata: FontAwesomeIcons.tasks,
                      active: currentPage == 1,
                    ),
                  ),
                ],
              ),
            ),
            body: _buildPage(currentPage),
          );
        },
      ),
    );
  }

  Widget _buildPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return BlocProvider(
          create: (context) => ProjectsCubit()..getProjects(context),
          child: const ProjectScreen(),
        );

      case 1:
        return const MyTasksScreen();

      default:
        return const SizedBox.shrink();
    }
  }
}
