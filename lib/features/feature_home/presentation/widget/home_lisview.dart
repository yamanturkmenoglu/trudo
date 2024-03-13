import 'package:flutter/material.dart';
import 'package:trudo/model/home_list.dart';

class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

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
                    Positioned.fill(
                      child: Image.asset(
                        listData!.imagePath,
                        fit: BoxFit.cover,
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
// ClipRRect(
//   borderRadius: const BorderRadius.all(Radius.circular(4.0)),
//   child: Stack(
//     alignment: AlignmentDirectional.center,
//     children: <Widget>[
//       Positioned.fill(
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(4.0)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5), // Gölge rengi
//                 spreadRadius: 2, // Yayılma yarıçapı
//                 blurRadius: 5, // Bulanıklık yarıçapı
//                 offset: Offset(0, 3), // Gölgenin konumu (x, y)
//               ),
//             ],
//           ),
//           child: Image.asset(
//             listData!.imagePath,
//             fit: BoxFit.cover,
//             // Görüntü içine gölge eklendi
//             color: Colors.white.withOpacity(0.2), // Beyaz renkli hafif bir gölge
//             colorBlendMode: BlendMode.lighten,
//           ),
//         ),
//       ),
//       Material(
//         color: Colors.transparent,
//         child: InkWell(
//           splashColor: Colors.grey.withOpacity(0.2),
//           borderRadius:
//               const BorderRadius.all(Radius.circular(4.0)),
//           onTap: callBack,
//         ),
//       ),
//     ],
//   ),
// ),
