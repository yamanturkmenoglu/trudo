import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';

class CalendersScreen extends StatefulWidget {
  const CalendersScreen({super.key});

  @override
  State<CalendersScreen> createState() => _CalendersScreenState();
}

class _CalendersScreenState extends State<CalendersScreen> {
  DateTime today = DateTime.now();
  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CusttomAppBarCalenderScreen(
                title: 'Calendars',
                onTap: () {
                  context.push(AppRoutes.addCalendersScreen);
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  TableCalendar(
                    locale: 'en-US',
                    rowHeight: 43,
                    headerStyle: HeaderStyle(
                      leftChevronIcon: const Icon(
                        Icons.chevron_left,
                        color: AppColor.primarycolor,
                      ),
                      rightChevronIcon: const Icon(
                        Icons.chevron_right,
                        color: AppColor.primarycolor,
                      ),
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle:
                          poppinsMediumNormal.copyWith(color: AppColor.purple),
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: today,
                    firstDay: DateTime.utc(2023, 10, 16),
                    lastDay: DateTime.utc(2040, 3, 15),
                    onDaySelected: onDaySelected,
                    calendarStyle: const CalendarStyle(
                      todayTextStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: AppColor.purple),
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0x52979797),
                      ),
                      weekendTextStyle: TextStyle(color: AppColor.purple),
                      defaultTextStyle: TextStyle(color: Colors.white),
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.lightblack,
                      ),
                      selectedTextStyle: TextStyle(color: Colors.green),
                      outsideTextStyle: TextStyle(color: Colors.white),
                    ),
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        if (isSameDay(date, today)) {
                          return Positioned(
                            bottom: 4,
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'meetings',
                              style: poppinsSemiBoldExtraLarge.copyWith(
                                  color: AppColor.purple),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'To Do ',
                                  style: poppinsMediumNormal.copyWith(
                                      color: AppColor.purple),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Spacer(),
                                Text(
                                  '${today.day.toString().padLeft(2, '0')}-${today.month.toString().padLeft(2, '0')}-${today.year}',
                                  style: poppinsMediumNormal.copyWith(
                                      color: AppColor.purple),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                        items: const [
                          MeetingCard(),
                          MeetingCard(),
                          MeetingCard(),
                          MeetingCard(),
                          MeetingCard(),
                          MeetingCard(),
                        ],
                        options: CarouselOptions(
                          height: 300,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class MeetingCard extends StatelessWidget {
  const MeetingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.editCalendersScreen);
      },
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.lightblack,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circle,
                        color: AppColor.primarycolor,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '12:00 - 18:00',
                        style: poppinsMediumNormal.copyWith(
                            color: AppColor.purple, fontSize: 18),
                      ),
                      const Spacer(),
                      Text('Sam Smith',
                          style: poppinsMediumNormal.copyWith(
                              color: AppColor.grifortext))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Meeting with friends Meeting with friends Meeting with friends ',
                      style:
                          poppinsMediumNormal.copyWith(color: AppColor.purple)),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(80, 151, 151, 151),
                ),
                child: Center(
                  child: Text(
                    'NOT DONE',
                    style: poppinsSemiBoldExtraLarge.copyWith(
                        color: AppColor.purple),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CusttomAppBarCalenderScreen extends StatelessWidget {
  const CusttomAppBarCalenderScreen({
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
          width: 50,
        ),
        Text(
          title,
          style: poppinsSemiBoldLarge.copyWith(color: AppColor.purple),
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
              FontAwesomeIcons.plus,
              color: AppColor.primarycolor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
