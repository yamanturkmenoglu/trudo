// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:trudo/core/hive/hive_class.dart';
// import 'package:trudo/core/router/routes_names.dart';

// import '../../../../core/constens/appcolors.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     navigateToHome();
//   }

//   Future<void> navigateToHome() async {
//     await Future.delayed(const Duration(seconds: 3));

//     final step = await UserBox.getInstance().then((box) => box.get('step'));

//     if (step?.step == '1') {
//       // ignore: use_build_context_synchronously
//       context.go(AppRoutes.welcomeScreen);
//     } else if (step?.step == '2') {
//       // ignore: use_build_context_synchronously
//       context.go(AppRoutes.home);
//     } else {
//       // ignore: use_build_context_synchronously
//       context.go(AppRoutes.introductionAnimationScreen);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.black,
//       body: content(),
//     );
//   }

//   Widget content() {
//     return Center(
//       child: Image.asset(
//         'assets/images/logo.jpg',
//         height: 300,
//         width: 300,
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/hive/hive_class.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'package:trudo/features/feature_auth/feature_check_token/cubit/check_token_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserInformationProvider? userInformationProvider;

  @override
  void initState() {
    super.initState();
    userInformationProvider =
        Provider.of<UserInformationProvider>(context, listen: false);
    getUser();
  }

  getUser() async {
    await Future.delayed(const Duration(seconds: 2));
    final step = await UserBox.getInstance().then((box) => box.get('step'));
    UserBox.getInstance();
    UserBox.getUserBox().then((value) => {
          if (value?.get("user") != null)
            {
              userInformationProvider?.setUserHiveModel(
                  value!.get("user")!, value.get("user")!.password!),
              log("userInformationProvider ${userInformationProvider?.userHiveModel}"),
              context
                  .read<CheckTokenCubit>()
                  .getCheckToken(context)
                  .then((value) {
                if (value.status == "JWT Valid!") {
                  context.go(AppRoutes.home);
                } else {
                  context.go(AppRoutes.login);
                }
              })
            }
          else
            {
              if (step?.step == '1')
                {
                  // ignore: use_build_context_synchronously
                  context.go(AppRoutes.welcomeScreen)
                }
              else
                {
                  // ignore: use_build_context_synchronously
                  context.go(AppRoutes.introductionAnimationScreen)
                }
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Center(
            child: Image.asset(
          'assets/images/logo.jpg',
          height: 300,
          width: 300,
        )));
  }
}