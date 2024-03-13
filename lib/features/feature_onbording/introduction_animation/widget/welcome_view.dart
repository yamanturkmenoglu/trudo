import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/appimages.dart';
import 'package:trudo/core/constens/textstyle.dart';

class WelcomeView extends StatelessWidget {
  final AnimationController? animationController;
  const WelcomeView({Key? key, this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final welcomeFirstHalfAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final welcomeImageAnimation =
        Tween<Offset>(begin: const Offset(4, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: welcomeImageAnimation,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 350),
                  child: Image.asset(
                    AppImageasset.applogo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SlideTransition(
                position: welcomeFirstHalfAnimation,
                child: Text("Welcome",
                    style: poppinsSemiBoldExtraLarge.copyWith(
                        color: AppColor.purple)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 64, right: 64, top: 16, bottom: 16),
                child: Text(
                    "Stay organised and live stress-free with you-do app",
                    textAlign: TextAlign.center,
                    style: poppinsMediumSmall.copyWith(color: AppColor.purple)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
