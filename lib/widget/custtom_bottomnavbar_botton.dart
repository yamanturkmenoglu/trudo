import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function()? onPressed;
  final String titel;
  final IconData icondata;
  final bool? active;
  const CustomBottomNavBar({
    super.key,
    required this.onPressed,
    required this.titel,
    required this.icondata,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.transparent,
      disabledColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: onPressed,
      child: Column(
        children: [
          FaIcon(
            icondata,
            size: 20,
            color: active == true ? AppColor.purple : AppColor.grifortext,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            titel,
            style: TextStyle(
              color: active ?? false ? AppColor.purple : AppColor.grifortext,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
