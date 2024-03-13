// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:go_router/go_router.dart';
// import 'package:trudo/core/constens/appcolors.dart';
// import 'package:trudo/core/constens/textstyle.dart';
// import 'package:trudo/core/router/routes_names.dart';

// class VerifyForgetPassword extends StatelessWidget {
//   const VerifyForgetPassword({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.black,
//       appBar: AppBar(
//         backgroundColor: AppColor.black,
//         iconTheme: const IconThemeData(color: AppColor.primarycolor),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Text('OTP code\nverifcation',
//                     style: poppinsSemiBoldExtraLarge.copyWith(
//                         color: AppColor.purple, fontSize: 40)),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                     'lorem ipsum dolor sit amet, consectetur adip element euismod er at gna',
//                     style: poppinsMediumSmall.copyWith(
//                         color: AppColor.grifortext)),
//                 const SizedBox(
//                   height: 60,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: OtpTextField(
//               cursorColor: AppColor.purple,
//               borderColor: Colors.transparent,
//               fieldWidth: 56,
//               filled: true,
//               fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
//               borderRadius: BorderRadius.circular(20),
//               numberOfFields: 5,
//               focusedBorderColor: AppColor.grifortext,
//               showFieldAsBox: true,
//               textStyle: const TextStyle(color: Colors.white),
//               onCodeChanged: (String code) {},
//               onSubmit: (String verificationCode) {
//                 context.push(AppRoutes.resetPasswordScreen);
//               },
//             ),
//           ),
//           const SizedBox(height: 80),
//         ],
//       ),
//     );
//   }
// }
