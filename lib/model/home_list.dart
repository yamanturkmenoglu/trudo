import 'package:flutter/widgets.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/appimages.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/sales_main_screen.dart';
import 'package:trudo/features/feature_password_managment/presentation/screen/password_mang_screen.dart';
import 'package:trudo/features/feature_to_do/presentation/screens/to_do_app_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/project_and_tasks_main_screen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.title = '',
    this.color = AppColor.primarycolor, // Default color
  });

  Widget? navigateScreen;
  String imagePath;
  String title;
  Color color; // Add color property

  static List<HomeList> homeList = [
    HomeList(
      title: 'Projects',
      imagePath: AppImageasset.projects,
      navigateScreen: const ProjectMainScreen(),
      color: const Color(0xFFA6A6A6), // Assign color
    ),
    HomeList(
      title: 'Sales',
      imagePath: AppImageasset.sales,
      navigateScreen: const SalesMainScreen(),
      color: const Color(0xFF737373), // Assign color
    ),
    HomeList(
      title: 'To Do',
      imagePath: AppImageasset.todo,
      navigateScreen: const ToDoAppScreen(),
      color: const Color(0xFF404040), // Assign color
    ),
    HomeList(
      title: 'Passwords',
      imagePath: AppImageasset.password,
      navigateScreen: const PasswordMangScreen(),
      color: const Color(0xFF262626), // Assign color
    ),
  ];
}
