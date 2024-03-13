// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/feature_Sales/presentation/widget/mysales/categories_row.dart';
import 'package:trudo/features/feature_Sales/presentation/widget/mysales/pie_chart_view.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/pipline/pipeline_screen.dart';

class MySalesScreen extends StatefulWidget {
  const MySalesScreen({super.key});

  @override
  State<MySalesScreen> createState() => _MySalesScreenState();
}

class _MySalesScreenState extends State<MySalesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawerMySales(),
      backgroundColor: AppColor.black,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CusttomAppBarPiplineLine(
                  title: 'My sales',
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CarouselSlider(
                  items: const [
                    MySalesCard(),
                    MySalesCard(),
                    MySalesCard(),
                    MySalesCard(),
                    MySalesCard(),
                    MySalesCard(),
                  ],
                  options: CarouselOptions(
                    height: 340,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.33,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: height * 0.065),
                      Text(
                        'Monthly Expenses',
                        style: poppinsMediumNormal.copyWith(
                          color: AppColor.purple,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Expanded(
                        child: Row(
                          children: <Widget>[
                            CategoriesRow(),
                            SizedBox(
                              width: 15,
                            ),
                            PieChartView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MySalesCard extends StatelessWidget {
  const MySalesCard({
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
                        'sold',
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

class CustomDrawerMySales extends StatelessWidget {
  const CustomDrawerMySales({
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
            DrawerInfoMySalesCard(
              color: AppColor.primarycolor,
              title: 'Service one',
            ),
            SizedBox(
              height: 50,
            ),
            DrawerInfoMySalesCard(
              color: Colors.lightBlue,
              title: 'Service two',
            ),
            SizedBox(
              height: 50,
            ),
            DrawerInfoMySalesCard(
              color: Colors.red,
              title: 'Service three',
            ),
            SizedBox(
              height: 50,
            ),
            DrawerInfoMySalesCard(
              color: Colors.amber,
              title: 'Others',
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerInfoMySalesCard extends StatelessWidget {
  const DrawerInfoMySalesCard({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;

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
                  const Padding(
                      padding: EdgeInsets.only(right: 30.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.purple,
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
