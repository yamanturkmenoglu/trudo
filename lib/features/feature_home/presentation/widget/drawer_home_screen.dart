import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/hive/hive_class.dart';
import 'package:trudo/core/hive/user.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'package:trudo/features/feature_home/presentation/widget/drawerlist.dart';

class CusttomDrawerHome extends StatelessWidget {
  const CusttomDrawerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userInformationProvider = context.read<UserInformationProvider>();
    return Drawer(
      backgroundColor: AppColor.lightblack,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Text("Hi, ${userInformationProvider.userName}",
                    style: poppinsMediumNormal.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.purple,
                        fontSize: 16)),
                const SizedBox(
                  width: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: FaIcon(
                    FontAwesomeIcons.handsClapping,
                    color: AppColor.primarycolor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                CusttomListTitleDrawer(
                  onTap: () {
                    context.push(AppRoutes.helpScreen);
                  },
                  title1: 'Help',
                  icon: FontAwesomeIcons.headset,
                ),
                const SizedBox(
                  height: 20,
                ),
                CusttomListTitleDrawer(
                  onTap: () {
                    context.push(AppRoutes.feedBackScreen);
                  },
                  title1: 'FeedBack',
                  icon: Icons.comment,
                ),
                const SizedBox(
                  height: 20,
                ),
                CusttomListTitleDrawer(
                  onTap: () {
                    context.push(AppRoutes.inviteFriends);
                  },
                  title1: 'Invite Friends',
                  icon: Icons.person_search,
                ),
                const SizedBox(
                  height: 20,
                ),
                CusttomListTitleDrawer(
                  onTap: () {},
                  title1: 'Rate the app',
                  icon: Icons.share,
                ),
                const SizedBox(
                  height: 20,
                ),
                CusttomListTitleDrawer(
                  onTap: () {},
                  title1: 'Abuot Us',
                  icon: FontAwesomeIcons.flag,
                ),
              ],
            ),
            const Spacer(),
            MaterialButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                logOut(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sign out",
                      style: poppinsSemiBoldLarge.copyWith(
                          color: AppColor.purple)),
                  const FaIcon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

logOut(BuildContext context) async {
  UserInformationProvider provider = UserInformationProvider();
  Navigator.pop(context);
  await UserBox.clearBox();
  final user = UserHiveModel();
  provider.setUserHiveModel(user, "");

  await _saveStepToHive('1');

  // ignore: use_build_context_synchronously
  context.go(AppRoutes.splashScreen);
}

Future<void> _saveStepToHive(String step) async {
  await UserBox.putBox('step', UserHiveModel(step: step));
}
