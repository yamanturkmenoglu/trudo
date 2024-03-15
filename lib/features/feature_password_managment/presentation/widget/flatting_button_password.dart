import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class FloatingActionButtonPassword extends StatelessWidget {
  const FloatingActionButtonPassword({
    super.key,
    this.onTapAddAction,
    this.onTapAddContact,
  });
  final void Function()? onTapAddAction;
  final void Function()? onTapAddContact;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: AppColor.lightblack,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(color: AppColor.purple),
      overlayColor: AppColor.black.withOpacity(0.3),
      spacing: 10,
      spaceBetweenChildren: 10,
      children: [
        SpeedDialChild(
            onTap: onTapAddAction,
            backgroundColor: AppColor.lightblack,
            child: const Icon(
              Icons.add,
              color: AppColor.primarycolor,
            ),
            label: 'Add New Account',
            labelStyle: poppinsMediumSmall.copyWith(color: AppColor.black)),
      ],
    );
  }
}
