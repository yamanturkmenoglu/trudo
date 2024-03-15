import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/model/home_list.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key? key,
    this.listData,
    this.callBack,
    this.animationController,
    this.animation,
    required this.multiple,
  }) : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final bool multiple;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      listData!.imagePath,
                      fit: BoxFit.cover,
                      height: multiple ? 60 : 120,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        listData!.title,
                        style: multiple
                            ? poppinsMediumSmall.copyWith(
                                color: AppColor.purple,
                              )
                            : poppinsMediumNormal.copyWith(
                                color: AppColor.purple, fontSize: 20),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
