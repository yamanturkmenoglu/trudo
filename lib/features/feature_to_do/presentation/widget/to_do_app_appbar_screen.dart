import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/providers/user_information_provider.dart';

class ToDoAppAppBar extends StatelessWidget {
  const ToDoAppAppBar({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final userInformationProvider = context.read<UserInformationProvider>();
    String userNameInitials = userInformationProvider.userName.isNotEmpty
        ? userInformationProvider.userName[0].toUpperCase()
        : "";

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFC18F04),
          radius: 18,
          child: Text(userNameInitials),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          userInformationProvider.userName,
          style: poppinsMediumSmall.copyWith(color: AppColor.purple),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: AppColor.grifortext,
            ),
          ),
        )
      ],
    );
  }
}
