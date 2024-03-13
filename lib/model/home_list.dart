import 'package:flutter/widgets.dart';
import 'package:trudo/core/constens/appimages.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/sales_main_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/project_and_tasks_main_screen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: AppImageasset.applogo,
      navigateScreen: const ProjectMainScreen(),
    ),
    HomeList(
        imagePath: AppImageasset.applogo,
        navigateScreen: const SalesMainScreen()),
    HomeList(
      imagePath: AppImageasset.applogo,
      navigateScreen: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("section3"))],
      ),
    ),
    HomeList(
      imagePath: AppImageasset.applogo,
      navigateScreen: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("section4"))],
      ),
    ),
  ];
}
