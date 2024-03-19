// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColor.black, body: ContactScreenBody());
  }
}

class ContactScreenBody extends StatelessWidget {
  const ContactScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CusttomAppBarContacts(
            title: 'Contacts',
            onTap: () {
              context.push(AppRoutes.addNewContactsScreen);
            },
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.push(AppRoutes.contactDetailsScreen);
                    },
                    child: ContactCards(
                      onPressedEdit: (BuildContext) {
                        context.push(AppRoutes.editContactsScreen);
                      },
                      onPressedDelete: (BuildContext) {},
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class ContactCards extends StatelessWidget {
  const ContactCards({
    super.key,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });
  final void Function(BuildContext) onPressedEdit;
  final void Function(BuildContext) onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            backgroundColor: const Color(0xFFFF2D1E),
            onPressed: onPressedDelete,
            icon: Icons.delete,
          ),
          SlidableAction(
            backgroundColor: AppColor.backgroundcolor,
            onPressed: onPressedEdit,
            icon: Icons.edit,
          )
        ]),
        child: Container(
          height: 170,
          decoration: BoxDecoration(
            color: AppColor.backgroundcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColor.black.withOpacity(.3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                          child: Text(
                        'NA',
                        style:
                            poppinsMediumNormal.copyWith(color: AppColor.white),
                      )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Name',
                          style: poppinsMediumNormal.copyWith(
                              color: AppColor.purple),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Position',
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.grifortext),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColor.primarycolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(child: Text('FU')),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        '0 531 854 02 08 ',
                        style:
                            poppinsMediumSmall.copyWith(color: AppColor.purple),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'yamanturkmenoglu24@gmail.com',
                        style:
                            poppinsMediumSmall.copyWith(color: AppColor.purple),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CusttomAppBarContacts extends StatelessWidget {
  const CusttomAppBarContacts({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.users,
              color: AppColor.purple,
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                title,
                style: poppinsSemiBoldLarge.copyWith(color: AppColor.purple),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColor.lightblack,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.add,
              color: AppColor.purple,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
