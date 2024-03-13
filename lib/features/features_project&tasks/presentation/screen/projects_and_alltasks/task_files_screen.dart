import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';

class TaskFilesScreen extends StatelessWidget {
  const TaskFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: AppColor.backgroundcolor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.photo_camera,
                  color: const Color(0x3EFFFFFF).withOpacity(0.2),
                  size: 16,
                ),
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
