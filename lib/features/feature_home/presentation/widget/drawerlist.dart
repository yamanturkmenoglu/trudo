import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class CusttomListTitleDrawer extends StatelessWidget {
  final String title1;
  final IconData icon;
  final void Function()? onTap;
  const CusttomListTitleDrawer(
      {super.key, required this.title1, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.purple.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: AppColor.primarycolor,
          ),
          title: Text(title1,
              style: poppinsMediumNormal.copyWith(
                  fontSize: 14, color: AppColor.purple)),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.grifortext,
          ),
        ),
      ),
    );
  }
}
