import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class SearchBarTextFild extends StatelessWidget {
  const SearchBarTextFild({
    super.key, this.onChanged,
  });
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: AppColor.purple),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColor.grifortext,
          ),
          hintText: 'Search',
          hintStyle: poppinsMediumNormal.copyWith(color: AppColor.grifortext),
          filled: true,
          fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
          focusColor: AppColor.primarycolor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ),
    );
  }
}
