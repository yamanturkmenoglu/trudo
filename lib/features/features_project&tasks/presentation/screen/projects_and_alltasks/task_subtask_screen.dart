import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class TaskSubTaskScreen extends StatelessWidget {
  const TaskSubTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Task',
                    style:
                        poppinsSemiBoldNormal.copyWith(color: AppColor.purple),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const AddSubTaskButtomSheet();
                        },
                      );
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      size: 14,
                    ),
                    label: Text(
                      'Create sub task',
                      style:
                          poppinsMediumSmall.copyWith(color: AppColor.purple),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('12.12.2023'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.done),
                    label: const Text('    Save     '),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 110,
            )
          ],
        ));
  }
}

class AddSubTaskButtomSheet extends StatelessWidget {
  const AddSubTaskButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: const BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel',
                        style: poppinsMediumNormal.copyWith(
                            color: AppColor.primarycolor)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Save',
                        style: poppinsMediumNormal.copyWith(
                            color: AppColor.primarycolor)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                style: const TextStyle(color: AppColor.purple),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle:
                      poppinsMediumNormal.copyWith(color: AppColor.grifortext),
                  filled: true,
                  fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                  focusColor: AppColor.primarycolor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: AppColor.primarycolor.withOpacity(0.4)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
