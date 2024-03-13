import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/pipline/pipeline_screen.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/services/services_screen.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/calenders/calenders_screen.dart';
import 'package:trudo/features/feature_Sales/presentation/screens/mysales/my_sales_screen.dart';
import 'package:trudo/features/feature_home/cubit/navbar_cubit.dart';
import 'package:trudo/widget/custtom_bottomnavbar_botton.dart';

class SalesMainScreen extends StatelessWidget {
  const SalesMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentPage) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              color: AppColor.lightblack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomBottomNavBar(
                      onPressed: () {
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .changePage(0);
                      },
                      titel: "Pipline",
                      icondata: FontAwesomeIcons.linesLeaning,
                      active: currentPage == 0,
                    ),
                  ),
                  Expanded(
                    child: CustomBottomNavBar(
                      onPressed: () {
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .changePage(1);
                      },
                      titel: "My Sales",
                      icondata: FontAwesomeIcons.scaleBalanced,
                      active: currentPage == 1,
                    ),
                  ),
                  Expanded(
                    child: CustomBottomNavBar(
                      onPressed: () {
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .changePage(2);
                      },
                      titel: "Calendars",
                      icondata: FontAwesomeIcons.calendar,
                      active: currentPage == 2,
                    ),
                  ),
                  Expanded(
                    child: CustomBottomNavBar(
                      onPressed: () {
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .changePage(3);
                      },
                      titel: "Services",
                      icondata: FontAwesomeIcons.servicestack,
                      active: currentPage == 3,
                    ),
                  ),
                ],
              ),
            ),
            body: _buildPage(currentPage),
          );
        },
      ),
    );
  }

  Widget _buildPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return const PipeLineScreen();
      case 1:
        return const MySalesScreen();
      case 2:
        return const CalendersScreen();
      case 3:
        return const ServicesScreen();
      default:
        return const SizedBox.shrink();
    }
  }
}
