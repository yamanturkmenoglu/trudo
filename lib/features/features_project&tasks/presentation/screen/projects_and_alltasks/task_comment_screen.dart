import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class TaskCommentScreen extends StatelessWidget {
  const TaskCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: AppColor.purple),
                      decoration: InputDecoration(
                        hintText: 'Add comment..',
                        hintStyle: poppinsMediumNormal.copyWith(
                            color: AppColor.grifortext, fontSize: 12),
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
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: AppColor.purple,
                      ))
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
