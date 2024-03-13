import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.black,
      body: Center(
        child: Text('Services'),
      ),
    );
  }
}
