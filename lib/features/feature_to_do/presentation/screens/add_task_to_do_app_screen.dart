import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/feature_to_do/presentation/widget/to_do_app_task_card.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/custom_text_form_field.dart';

class AddTaskToDoAppScreen extends StatefulWidget {
  const AddTaskToDoAppScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskToDoAppScreen> createState() => _AddTaskToDoAppScreenState();
}

class _AddTaskToDoAppScreenState extends State<AddTaskToDoAppScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isSearchContainerVisible = false;

  bool _isAddingTask = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isSearchContainerVisible = false;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          isSearchContainerVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Text(
                  'Group Name',
                  style: poppinsSemiBoldExtraLarge.copyWith(
                      color: AppColor.purple),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchContainerVisible = !isSearchContainerVisible;
                    });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: AppColor.grifortext,
                  ),
                ),
              ],
            ),
            Text(
              _getCurrentDate(),
              style: poppinsMediumNormal.copyWith(color: AppColor.purple),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isSearchContainerVisible ? 60 : 0,
              curve: Curves.easeInOut,
              child: Container(
                color: AppColor.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomTextFormField(
                    onEditingComplete: () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                      });
                    },
                    onChange: (value) {},
                    cursorColor: AppColor.primarycolor,
                    hintStyle: const TextStyle(color: AppColor.grifortext),
                    hintText: 'Search Group',
                    prefixIcon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: isSearchContainerVisible ? 28 : 0,
                      height: isSearchContainerVisible ? 28 : 0,
                      curve: Curves.easeInOut,
                      child: const Icon(
                        Icons.search,
                        color: AppColor.grifortext,
                        size: 28,
                      ),
                    ),
                    style:
                        const TextStyle(color: AppColor.purple, fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ), 
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: AppColor.black,
                shadowColor: Colors.black,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return const ToDoAppTaskCard();
                  },
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  _isAddingTask = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: _isAddingTask
                    ? TextField(
                        style:
                            poppinsMediumSmall.copyWith(color: AppColor.purple),
                        decoration: InputDecoration(
                          hintText: 'Enter Task',
                          hintStyle: poppinsMediumSmall.copyWith(
                              color: AppColor.purple),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(83, 151, 151, 151),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isAddingTask = false;
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: AppColor.purple,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(83, 151, 151, 151),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColor.purple,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Add Task',
                                style: TextStyle(color: AppColor.purple),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String day = _getDayOfWeek(now.weekday);
    String date =
        "${now.day.toString().padLeft(2, '0')} ${_getMonth(now.month)}";
    return "$date  $day";
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }
}
