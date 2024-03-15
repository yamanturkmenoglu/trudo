import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';

class GroupsList extends StatelessWidget {
  const GroupsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        tileColor: AppColor.lightblack,
        leading: const Icon(
          Icons.add,
          color: AppColor.primarycolor,
        ),
        title: Text(
          'WordPress',
          style: poppinsMediumNormal.copyWith(color: AppColor.purple),
        ),
        trailing: Text(
          '2',
          style: poppinsMediumSmall.copyWith(color: AppColor.grifortext),
        ),
        onTap: () {
          context.push(AppRoutes.addTaskToDoAppScreen);
        },
      ),
    );
  }
}
