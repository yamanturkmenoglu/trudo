import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/init_main_app/initializ_main_app.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/core/router/router.dart';
import 'package:trudo/features/feature_auth/feature_check_token/cubit/check_token_cubit.dart';
import 'package:trudo/features/feature_auth/feature_forgetpassword/cubit/forget_password_cubit/forget_password_cubit_cubit.dart';
import 'package:trudo/features/feature_auth/feature_login/cubit/login_cubit/login_cubit_cubit.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/cubit/signup_cubit/signup_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/add_new_account_cubit/add_new_account_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_all_accounts_cubit/get_all_accounts_cubit_cubit.dart';
import 'package:trudo/features/feature_password_managment/cubit/get_category_password_cubit/get_category_password_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/edit_add_task_cubit/edit_add_task_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_cubit/get_projects_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_projects_tasks_cubit/projects_tasks_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_users_cubit/users_cubit_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final providerContainer = ProviderContainer();
  await Initializer.initializeMainApp();
  runApp(UncontrolledProviderScope(
      container: providerContainer, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(
            create: (_) => UserInformationProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProjectDetailsCubit(),
          ),
          BlocProvider(
            create: (context) => AllCategoryCubit()..getAllCategory(context),
          ),
          BlocProvider(
            create: (context) => AddTaskCubit(),
          ),
          BlocProvider(
            create: (context) => AllUsersCubit()..getAllUsers(context),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => CheckTokenCubit()..getCheckToken(context),
          ),
          BlocProvider(
            create: (context) => SignupCubit(),
          ),
          BlocProvider(create: (context) => ForgetPasswordCubit()),
          BlocProvider(create: (context) => AddNewAccountCubit()),
          BlocProvider(
              create: (context) => AllAccountsCubit()..getAllAccounts()),
          BlocProvider(
              create: (context) => ProjectsCubit()..getProjects(context))
        ],
        child: AppRouter(
          builder: (context, router) => MaterialApp.router(
            theme: ThemeData(
                dividerColor: AppColor.lightblack,
                scaffoldBackgroundColor: AppColor.black,
                primaryColor: AppColor.primarycolor),
            title: 'TRUDO',
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            builder: (context, child) {
              return Material(
                child: child!,
              );
            },
          ),
        ),
      ),
    );
  }
}
