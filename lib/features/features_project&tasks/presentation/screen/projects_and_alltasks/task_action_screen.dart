import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class TaskActionScreen extends StatelessWidget {
  const TaskActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Title',
                style: poppinsSemiBoldNormal.copyWith(color: AppColor.purple),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'BACK LOG',
                style: poppinsMediumSmall.copyWith(color: AppColor.grifortext),
              ),
              const SizedBox(height: 20),
              Text(
                'Description',
                style: poppinsSemiBoldNormal.copyWith(color: AppColor.purple),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'lorem text gulu lorem and title description text color red blue nice color to end text',
                style: poppinsMediumSmall.copyWith(color: AppColor.grifortext),
              ),
              const SizedBox(height: 20),
              Text(
                'User',
                style: poppinsSemiBoldNormal.copyWith(color: AppColor.purple),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'YAMAN TÜRKMENOĞLU',
                style: poppinsMediumSmall.copyWith(color: AppColor.grifortext),
              ),
              const SizedBox(height: 20),
              Text(
                'Created At',
                style: poppinsSemiBoldNormal.copyWith(color: AppColor.purple),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '25/01/2024, 12:09:16',
                style: poppinsMediumSmall.copyWith(color: AppColor.grifortext),
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
                        backgroundColor:
                            const Color(0x3EFFFFFF).withOpacity(0.2),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.done),
                      label: const Text(' finished '),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color(0x3EFFFFFF).withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 110,
              )
            ],
          ),
        ));
  }
}
