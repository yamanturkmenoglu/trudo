import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final Color iconColor;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final IconData iconData;
  final bool obscureText;
  final Function(String value)? onChange;
  const AuthField({
    super.key,
    required this.iconColor,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    required this.iconData,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: AppColor.purple),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: AppColor.grifortext),
        filled: true,
        fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
        focusColor: AppColor.primarycolor,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primarycolor.withOpacity(0.4)),
        ),
        prefixIcon: Icon(
          iconData,
          size: 18,
          color: const Color(0x3EFFFFFF),
        ),
      ),
      cursorColor: AppColor.primarycolor,
    );
  }
}
