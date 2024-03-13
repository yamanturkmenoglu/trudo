import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? btnColor;
  final Color? fontColor;
  const PrimaryButton(
      {super.key,
      required this.text,
      this.height,
      this.width,
      this.fontSize,
      this.btnColor,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: 240,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColor.backgroundcolor,
          borderRadius: BorderRadius.circular(10)),
      child: Text(text,
          style: poppinsMediumNormal.copyWith(
              color: AppColor.purple, fontWeight: FontWeight.bold)),
    );
  }
}
