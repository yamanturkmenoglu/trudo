import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/appimages.dart';
import 'package:trudo/core/router/routes_names.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 120),
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 350),
                  child: Image.asset(
                    AppImageasset.applogo,
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.purple),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "Stay organised and live stress-free with you-do app",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColor.purple),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.push(AppRoutes.signUp);
                  },
                  child: Container(
                    height: 58,
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.backgroundcolor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColor.purple,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.arrow_forward_rounded,
                              color: AppColor.purple),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          context.push(AppRoutes.login);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColor.primarycolor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
