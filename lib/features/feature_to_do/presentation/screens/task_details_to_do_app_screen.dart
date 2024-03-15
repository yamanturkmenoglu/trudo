import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class TaskDetailsToDoAppScreen extends StatefulWidget {
  const TaskDetailsToDoAppScreen({super.key});

  @override
  State<TaskDetailsToDoAppScreen> createState() =>
      _TaskDetailsToDoAppScreenState();
}

class _TaskDetailsToDoAppScreenState extends State<TaskDetailsToDoAppScreen> {
  bool _isAddingTask = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.black,
        iconTheme: const IconThemeData(color: AppColor.primarycolor),
        title: Text(
          'Task Group',
          style: poppinsMediumSmall.copyWith(color: AppColor.purple),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.done,
              color: AppColor.primarycolor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  FontAwesomeIcons.circle,
                  color: AppColor.primarycolor,
                ),
                const SizedBox(width: 10),
                Text(
                  'Task Title',
                  style: poppinsMediumNormal.copyWith(color: AppColor.purple),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.star,
                      size: 20,
                      color: Color(0xFF8F53C1),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  FontAwesomeIcons.circle,
                  size: 20,
                  color: AppColor.primarycolor,
                ),
                const SizedBox(width: 10),
                Text(
                  'Step Title',
                  style: poppinsMediumNormal.copyWith(color: AppColor.purple),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.ellipsis,
                      size: 20,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
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
                        hintText: 'Enter Step',
                        hintStyle: poppinsMediumNormal.copyWith(
                            color: AppColor.purple),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColor.black,
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
                        color: AppColor.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.add,
                              color: AppColor.purple,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Add Step',
                              style: poppinsMediumNormal.copyWith(
                                  color: AppColor.purple),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: AppColor.grifortext,
              thickness: 0.2,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              FontAwesomeIcons.paperclip,
              color: AppColor.grifortext,
            ),
            title: Text(
              'Add File',
              style: poppinsMediumNormal.copyWith(color: AppColor.grifortext),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: AppColor.grifortext,
              thickness: 0.2,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Text(
              'Your Note Here',
              style: poppinsMediumNormal.copyWith(color: AppColor.purple),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              onChanged: (String value) {},
              style: const TextStyle(color: AppColor.purple),
              decoration: InputDecoration(
                hintText: 'Description ... ',
                hintStyle:
                    poppinsMediumNormal.copyWith(color: AppColor.grifortext),
                filled: true,
                fillColor: const Color.fromARGB(61, 8, 7, 7).withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColor.primarycolor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AppColor.primarycolor.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AppColor.primarycolor.withOpacity(0.3)),
                ),
              ),
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
