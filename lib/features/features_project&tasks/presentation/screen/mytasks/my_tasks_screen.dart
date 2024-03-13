import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Column(children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text('Hi YAMAN',
                    style:
                        poppinsSemiBoldLarge.copyWith(color: AppColor.purple)),
              ],
            ),
          ),
          const Divider(
            color: AppColor.grifortext,
            thickness: 0.3,
          ),
          const Filter(),
          // Expanded(
          //   child: ListView(
          //     children: [
          //       InkWell(
          //           onTap: () {
          //             context.push(AppRoutes.taskDetailsScreen);
          //           },
          //           child: const TaskCard()),
          //       const TaskCard(),
          //       const TaskCard(),
          //       const TaskCard(),
          //       const TaskCard(),
          //       const TaskCard(),
          //       const TaskCard(),
          //       const TaskCard(),
          //       const TaskCard(),
          //     ],
          //   ),
          // )
        ]));
  }
}

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Text('Filter',
              style: poppinsMediumSmall.copyWith(
                  color: AppColor.purple, fontSize: 15)),
          const Spacer(),
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Adjust the corner radius as needed
                // You can add a border if desired
              ),
              icon: const FaIcon(
                FontAwesomeIcons.filter,
                color: AppColor.purple,
                size: 15,
              ),
              color: AppColor.white,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("All projects",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("WWWings",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("PROJECT",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("SKY GARD",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      child: Text("TruBuy",
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.black)),
                    ),
                  ])
        ],
      ),
    );
  }
}
