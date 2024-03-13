// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:trudo/core/constens/appcolors.dart';
// import 'package:trudo/core/constens/textstyle.dart';
// import 'package:trudo/core/router/routes_names.dart';
// import 'package:trudo/features/feature_auth/feature_login/presentation/processing/password_valid.dart';
// import 'package:trudo/widget/login_button.dart';
// import 'package:trudo/widget/textfild.dart';

// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({Key? key}) : super(key: key);

//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   bool isPasswordVisible1 = false;
//   bool isPasswordVisible2 = false;

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController passwordtowController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.black,
//       appBar: AppBar(
//         backgroundColor: AppColor.black,
//         iconTheme: const IconThemeData(color: AppColor.primarycolor),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 50),
//                 Text('Create\nNew Password',
//                     style: poppinsSemiBoldExtraLarge.copyWith(
//                         color: AppColor.purple, fontSize: 40)),
//                 const SizedBox(height: 20),
//                 Text(
//                     'lorem ipsum dolor sit amet, consectetur adip element euismod er at inter libero et inter dolore magna',
//                     style: poppinsMediumSmall.copyWith(
//                         color: AppColor.grifortext)),
//                 const SizedBox(height: 80),
//                 AuthField(
//                   iconColor: AppColor.purple,
//                   controller: passwordController,
//                   keyboardType: TextInputType.visiblePassword,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     if (!isPasswordStrong(value)) {
//                       return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.';
//                     }
//                     return null;
//                   },
//                   hintText: 'Password',
//                   iconData: Icons.lock,
//                   suffixIcon: InkWell(
//                     highlightColor: Colors.transparent,
//                     splashColor: Colors.transparent,
//                     onTap: () {
//                       setState(() {
//                         isPasswordVisible1 = !isPasswordVisible1;
//                       });
//                     },
//                     child: Icon(
//                       isPasswordVisible1
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: AppColor.purple,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 AuthField(
//                   iconColor: AppColor.purple,
//                   controller: passwordtowController,
//                   keyboardType: TextInputType.visiblePassword,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     if (!isPasswordStrong(value)) {
//                       return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.';
//                     }
//                     return null;
//                   },
//                   hintText: 'Password',
//                   iconData: Icons.lock,
//                   suffixIcon: InkWell(
//                     highlightColor: Colors.transparent,
//                     splashColor: Colors.transparent,
//                     onTap: () {
//                       setState(() {
//                         isPasswordVisible2 = !isPasswordVisible2;
//                       });
//                     },
//                     child: Icon(
//                       isPasswordVisible2
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: AppColor.purple,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 120),
//                 Center(
//                   child: InkWell(
//                     highlightColor: Colors.transparent,
//                     splashColor: Colors.transparent,
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         context.push(AppRoutes.login);
//                       }
//                     },
//                     child: const PrimaryButton(text: 'Confirm'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
