import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/calenders/add_calender_screen.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/calenders/edit_calender_screen.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/contact/add_new-contacts_screen.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/contact/contact_screen.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/contact/edit_contact_screen.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/pipline/add_new_action_pipline_screen.dart';
import 'package:trudo/features/feature_auth/feature_forgetpassword/presentation/screen/forgetpassword_screen.dart';
import 'package:trudo/features/feature_auth/feature_login/presentation/screens/login_screen.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/presentation/screens/sign_up_screen.dart';
import 'package:trudo/features/feature_auth/feature_splash/presentation/splashscreen.dart';
import 'package:trudo/features/feature_auth/feature_welcome/presentation/screen/welcome_screen.dart';
import 'package:trudo/features/feature_home/presentation/screen/feedback_screen.dart';
import 'package:trudo/features/feature_home/presentation/screen/help_screen.dart';
import 'package:trudo/features/feature_home/presentation/screen/home_screen.dart';
import 'package:trudo/features/feature_home/presentation/screen/invite_frindes.dart';
import 'package:trudo/features/feature_onbording/introduction_animation/screen/introduction_animation_screen.dart';
import 'package:trudo/features/feature_password_managment/cubit/add_new_account_cubit/add_new_account_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/presentation/screen/add_new_account_screen.dart';
import 'package:trudo/features/feature_to_do/presentation/screens/add_task_to_do_app_screen.dart';
import 'package:trudo/features/feature_to_do/presentation/screens/task_details_to_do_app_screen.dart';
// ignore: unused_import
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart'
    // ignore: library_prefixes
    as ProjectModels;
import 'package:trudo/features/features_project&tasks/data/model/projects_model.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/project_task_details_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/task_details_screen.dart';

final routes = [
  GoRoute(
    path: AppRoutes.splashScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const SplashScreen(),
    ),
  ),

  GoRoute(
    path: AppRoutes.introductionAnimationScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const IntroductionAnimationScreen(),
    ),
  ),
  /////////////////////////////////auth//////////////////////////////
  GoRoute(
    path: AppRoutes.welcomeScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const WelcomeScreen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.login,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const LoginScreen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.signUp,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const SignUpScreen(),
    ),
  ),
  // GoRoute(
  //   path: AppRoutes.verifySignUp,
  //   pageBuilder: (context, state) => CupertinoPage<void>(
  //     key: state.pageKey,
  //     child: const Verifycodesignup(),
  //   ),
  // ),
  GoRoute(
    path: AppRoutes.forgetPasswordScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const ForgetPasswordScreen(),
    ),
  ),
  // GoRoute(
  //   path: AppRoutes.verifyForgetPassword,
  //   pageBuilder: (context, state) => CupertinoPage<void>(
  //     key: state.pageKey,
  //     child: const VerifyForgetPassword(),
  //   ),
  // ),
  // GoRoute(
  //   path: AppRoutes.resetPasswordScreen,
  //   pageBuilder: (context, state) => CupertinoPage<void>(
  //     key: state.pageKey,
  //     child: const ResetPasswordScreen(),
  //   ),
  // ),
  ///////////////////////////////Home///////////////////////////////
  GoRoute(
    path: AppRoutes.home,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const MyHomePage(),
    ),
  ),
  GoRoute(
    path: AppRoutes.feedBackScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const FeedbackScreen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.helpScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const HelpScreen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.inviteFriends,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const InviteFriend(),
    ),
  ),
  ///////////////////////////////Projects&Tasks///////////////////////////

  // ),
  GoRoute(
      path: AppRoutes.projectTaskDetailsScreen,
      pageBuilder: (context, state) {
        final stateExtra = state.extra as ProjectsModel;
        return CupertinoPage<void>(
          key: state.pageKey,
          child: ProjectTaskDetailsScreen(projectsModel: stateExtra),
        );
      }),

  GoRoute(
    path: AppRoutes.taskDetailsScreen,
    pageBuilder: TaskDetailsScreen.builder,
  ),

  /////////////////////////////////Sales///////////////////////////////////
  GoRoute(
    path: AppRoutes.addNewActionPiplineScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const AddNewActionPiplineScreen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.contactScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const ContactScreen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.addNewContactsScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const AddNewContactsScreen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.editContactsScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const EditContactScreeen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.addCalendersScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const AddCalenderScreen(),
    ),
  ),
  GoRoute(
    path: AppRoutes.editCalendersScreen,
    pageBuilder: (context, state) => CupertinoPage<void>(
      key: state.pageKey,
      child: const EditCalenderScreen(),
    ),
  ),
  GoRoute(
      path: AppRoutes.addTaskToDoAppScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
            key: state.pageKey,
            child: const AddTaskToDoAppScreen(),
          )),
  GoRoute(
      path: AppRoutes.taskDetailsToDoAppScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
            key: state.pageKey,
            child: const TaskDetailsToDoAppScreen(),
          )),

  GoRoute(
      path: AppRoutes.addpasswordScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => AddNewAccountCubit(),
              child: const AddNewAccountScreen(),
            ),
          )),
];
