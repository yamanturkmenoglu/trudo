import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/appimages.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/sales_main_screen.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_all_accounts_cubit/get_all_accounts_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/presentation/screen/password_mang_screen.dart';
import 'package:trudo/features/feature_to_do/presentation/screens/to_do_app_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/project_and_tasks_main_screen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.title = '',
  });

  Widget? navigateScreen;
  String imagePath;
  String title;

  static List<HomeList> homeList = [
    HomeList(
      title: 'Projects & Tasks',
      imagePath: AppImageasset.projects,
      navigateScreen: const ProjectMainScreen(),
    ),
    HomeList(
        title: 'Sales',
        imagePath: AppImageasset.sales,
        navigateScreen: const SalesMainScreen()),
    HomeList(
        title: 'To Do',
        imagePath: AppImageasset.todo,
        navigateScreen: const ToDoAppScreen()),
    HomeList(
        title: 'Password Managment',
        imagePath: AppImageasset.password,
        navigateScreen: BlocProvider(
          create: (context) => AllAccountsCubit()..getAllAccounts(),
          child: const PasswordMangScreen(),
        )),
  ];
}
