import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trudo/core/constens/appcolors.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final Color? iconColor;
  const SocialButton(
      {super.key, required this.onTap, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 59,
        width: 59,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.purple,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 32,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(0.25))
            ]),
        child: SvgPicture.asset(
          icon,
          // ignore: deprecated_member_use
          color: iconColor,
        ),
      ),
    );
  }
}
