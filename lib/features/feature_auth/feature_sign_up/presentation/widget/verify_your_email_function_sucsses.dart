import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';

verifyYourEmailFunction(context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.black, // Set background color here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Lottie.asset('assets/images/done.json',
                width: 150, height: 150, repeat: false),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Registration process",
                  style: poppinsMediumNormal.copyWith(color: AppColor.purple)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  "Your registration request has been received, please wait until your account is accepted, the account is accepted by the admin.",
                  style: poppinsMediumSmall.copyWith(
                      color: AppColor.purple)), // Set text color here
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      context.go(AppRoutes.login);
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(color: AppColor.primarycolor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
