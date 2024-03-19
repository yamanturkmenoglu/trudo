import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/features/features_project&tasks/data/model/all_users_model.dart';

import '../../../../core/constens/textstyle.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
    super.key,
    required this.allUsersModel,
  });
  final AllUsersModel allUsersModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.lightblack,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFC18F04),
                    radius: 18,
                    child: Text(
                        allUsersModel.firstName.toString()[0].toUpperCase()),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${allUsersModel.firstName.toString()} ${allUsersModel.lastName.toString()}',
                    style: poppinsMediumSmall.copyWith(color: AppColor.purple),
                  ),
                  const Spacer(),
                  allUsersModel.active == true
                      ? Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC18F04),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'Active',
                              style: poppinsMediumSmall.copyWith(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 21, 21),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'Disable',
                              style: poppinsMediumSmall.copyWith(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(allUsersModel.username.toString(),
                      style:
                          poppinsMediumSmall.copyWith(color: AppColor.purple)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    allUsersModel.phoneNumber.toString(),
                    style: poppinsMediumSmall.copyWith(color: AppColor.purple),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    allUsersModel.roles.toString(),
                    style: poppinsMediumSmall.copyWith(color: AppColor.purple),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
