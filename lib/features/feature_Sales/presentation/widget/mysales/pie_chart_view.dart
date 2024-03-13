import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/feature_Sales/presentation/widget/mysales/pie_chart.dart';

class PieChartView extends StatelessWidget {
  const PieChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: LayoutBuilder(
        builder: (context, constraint) => Container(
          decoration: const BoxDecoration(
            color: AppColor.backgroundcolor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 17,
                offset: Offset(-5, -5),
                color: Color.fromARGB(76, 255, 255, 255),
              ),
              BoxShadow(
                spreadRadius: -2,
                blurRadius: 10,
                offset: Offset(7, 7),
                color: AppColor.lightblack,
              )
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: constraint.maxWidth * 0.6,
                  child: CustomPaint(
                    foregroundPainter: PieChart(
                      width: constraint.maxWidth * 0.5,
                      categories: kCategories,
                    ),
                    child: const Center(),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: constraint.maxWidth * 0.4,
                  decoration: BoxDecoration(
                    color: AppColor.backgroundcolor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 1,
                        offset: Offset(-1, -1),
                        color: Color.fromARGB(41, 255, 255, 255),
                      ),
                      BoxShadow(
                        spreadRadius: -2,
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '\$1280.20',
                      style:
                          poppinsMediumSmall.copyWith(color: AppColor.purple),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
