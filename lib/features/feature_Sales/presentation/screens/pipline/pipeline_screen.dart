// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';

class PipeLineScreen extends StatefulWidget {
  const PipeLineScreen({super.key});

  @override
  State<PipeLineScreen> createState() => _PipeLineScreenState();
}

class _PipeLineScreenState extends State<PipeLineScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawerPipline(),
      backgroundColor: AppColor.black,
      body: PiplineBody(scaffoldKey: _scaffoldKey),
    );
  }
}

class PiplineBody extends StatelessWidget {
  const PiplineBody({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 130.0,
          right: 16.0,
          child: FloatingActionButtonPipline(
            onTapAddAction: () {
              context.push(AppRoutes.addNewActionPiplineScreen);
            },
            onTapAddContact: () {
              context.push(AppRoutes.contactScreen);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              CusttomAppBarPiplineLine(
                title: 'PipLine',
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: const [
                  DrawerInfoSalesCard(
                    color: AppColor.primarycolor,
                    title: 'Closed Deals',
                    count: '7',
                  ),
                  DrawerInfoSalesCard(
                    color: Colors.lightBlue,
                    title: 'Follow up',
                    count: '5',
                  ),
                  DrawerInfoSalesCard(
                    color: Colors.red,
                    title: 'Never in',
                    count: '2',
                  ),
                  DrawerInfoSalesCard(
                    color: Colors.amber,
                    title: 'Others',
                    count: '5',
                  ),
                ],
                options: CarouselOptions(
                  height: 80,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListWheelScrollView(
                    physics: const FixedExtentScrollPhysics(),
                    itemExtent: 260,
                    children: const [
                      PipLineCard(),
                      PipLineCard(),
                      PipLineCard(),
                      PipLineCard(),
                      PipLineCard(),
                      PipLineCard(),
                    ]),
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PipLineCard extends StatelessWidget {
  const PipLineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            backgroundColor: const Color(0xFFFF2D1E),
            onPressed: (BuildContext) {},
            icon: Icons.delete,
          ),
          SlidableAction(
            backgroundColor: AppColor.backgroundcolor,
            onPressed: (BuildContext) {},
            icon: Icons.edit,
          )
        ]),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: AppColor.backgroundcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Contact Name',
                      style:
                          poppinsMediumNormal.copyWith(color: AppColor.purple),
                    ),
                    Column(
                      children: [
                        Text(
                          '22/03/2024',
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.purple),
                        ),
                        Text(
                          '10:00 - 11:00',
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.grifortext, fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tpra.me Whether training PR professionals through mentorships and accredited courses or offering clients global services with local flair, The PR Academy MENA is continuously raising the bar of PR and communication in the Middle East.',
                  style:
                      poppinsMediumSmall.copyWith(color: AppColor.grifortext),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            'YT',
                            style: poppinsMediumNormal.copyWith(
                                color: AppColor.white),
                          )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yaman Turkmen',
                          style: poppinsMediumNormal.copyWith(
                              color: AppColor.purple),
                        ),
                      ],
                    ),
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: AppColor.primarycolor.withOpacity(.3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                          child: Text(
                        'Follow',
                        style:
                            poppinsMediumNormal.copyWith(color: AppColor.white),
                      )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDrawerPipline extends StatelessWidget {
  const CustomDrawerPipline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: AppColor.lightblack,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            DrawerInfoSalesCard(
              color: AppColor.primarycolor,
              title: 'Closed Deals',
              count: '7',
            ),
            SizedBox(
              height: 50,
            ),
            DrawerInfoSalesCard(
              color: Colors.lightBlue,
              title: 'Follow up',
              count: '5',
            ),
            SizedBox(
              height: 50,
            ),
            DrawerInfoSalesCard(
              color: Colors.red,
              title: 'Never in',
              count: '2',
            ),
            SizedBox(
              height: 50,
            ),
            DrawerInfoSalesCard(
              color: Colors.amber,
              title: 'Others',
              count: '5',
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingActionButtonPipline extends StatelessWidget {
  const FloatingActionButtonPipline({
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
            label: 'Add New Action',
            labelStyle: poppinsMediumSmall.copyWith(color: AppColor.black)),
        SpeedDialChild(
            onTap: onTapAddContact,
            backgroundColor: AppColor.lightblack,
            child: const Icon(
              Icons.person,
              color: AppColor.primarycolor,
            ),
            label: 'Add New Contact',
            labelStyle: poppinsMediumSmall.copyWith(color: AppColor.black))
      ],
    );
  }
}

class DrawerInfoSalesCard extends StatelessWidget {
  const DrawerInfoSalesCard({
    super.key,
    required this.color,
    required this.title,
    required this.count,
  });
  final Color color;
  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColor.purple.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 10,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: poppinsMediumNormal.copyWith(color: AppColor.purple),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      count,
                      style:
                          poppinsSemiBoldLarge.copyWith(color: AppColor.purple),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class CusttomAppBarPiplineLine extends StatelessWidget {
  const CusttomAppBarPiplineLine({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
              Icons.bar_chart,
              color: AppColor.purple,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          width: 120,
        ),
        Text(
          title,
          style: poppinsSemiBoldLarge.copyWith(color: AppColor.purple),
        )
      ],
    );
  }
}
