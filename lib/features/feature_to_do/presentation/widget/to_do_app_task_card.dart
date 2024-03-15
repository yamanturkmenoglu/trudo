import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';

class ToDoAppTaskCard extends StatelessWidget {
  const ToDoAppTaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            backgroundColor: const Color(0xFFFF2D1E),
            onPressed: (context) {},
            icon: Icons.delete,
          ),
        ]),
        child: ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          tileColor: AppColor.lightblack,
          leading: const Icon(
            FontAwesomeIcons.circle,
            color: AppColor.primarycolor,
          ),
          title: Text(
            'Task Title',
            style: poppinsMediumNormal.copyWith(color: AppColor.purple),
          ),
          subtitle: Text(
            'Task Description Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title',
            style: poppinsMediumSmall.copyWith(
                color: AppColor.grifortext, fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            context.push(AppRoutes.taskDetailsToDoAppScreen);
          },
        ),
      ),
    );
  }
}
