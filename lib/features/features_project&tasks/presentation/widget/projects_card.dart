import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/features/features_project&tasks/data/model/projects_model.dart';
import 'package:trudo/features/features_project&tasks/presentation/screen/projects_and_alltasks/project_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constens/appcolors.dart';
import '../../../../core/constens/textstyle.dart';

// class ProjectsCard extends StatelessWidget {
//   const ProjectsCard({
//     Key? key,
//     required this.projectsModel,
//   }) : super(key: key);

//   final ProjectsModel projectsModel;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 14),
//       child: Container(
//         width: 400,
//         height: 350,
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           image: DecorationImage(
//             image: NetworkImage(projectsModel.image?.url ??
//                 'http://via.placeholder.com/350x150'),
//             fit: BoxFit.cover,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.white.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 8,
//               offset: const Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: AppColor.white.withOpacity(0.2),
//                   borderRadius: const BorderRadius.all(Radius.circular(30)),
//                 ),
//                 child: Center(
//                   child: IconButton(
//                     onPressed: () {
//                       showModalBottomSheet<void>(
//                         context: context,
//                         isScrollControlled: true,
//                         builder: (BuildContext context) {
//                           return const EditProjectButtomSheet();
//                         },
//                       );
//                     },
//                     icon: const Icon(
//                       FontAwesomeIcons.ellipsis,
//                       color: AppColor.purple,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                   color: Colors.white.withOpacity(0.2),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5),
//                         child: Text(
//                           'Wwwwings Calendar',
//                           style: poppinsMediumNormal.copyWith(
//                             color: AppColor.purple,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5),
//                         child: Text(
//                           'Wwwwings Calenda Calendar Calendar Calendarr CalendarCalendarCalendarCalendar',
//                           style: poppinsMediumSmall.copyWith(
//                             color: AppColor.purple,
//                             fontSize: 10,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 5),
//                         child: Row(
//                           children: [
//                             Text(
//                               "Due: ",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: AppColor.purple,
//                               ),
//                             ),
//                             SizedBox(width: 3),
//                             Text(
//                               '12.04.1999',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: AppColor.purple,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class ProjectsCard extends StatelessWidget {
  const ProjectsCard({
    Key? key,
    required this.projectsModel,
  }) : super(key: key);

  final ProjectsModel projectsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 14),
      child: Container(
        width: 400,
        height: 350,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.07),
              spreadRadius: 0.5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                imageUrl: projectsModel.image?.url ??
                    'http://via.placeholder.com/350x150',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF515151).withOpacity(0.7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const EditProjectButtomSheet();
                              },
                            );
                          },
                          icon: const Icon(
                            FontAwesomeIcons.ellipsis,
                            color: AppColor.purple,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      color: const Color(0xFF515151).withOpacity(0.8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              projectsModel.title ?? "",
                              style: poppinsMediumNormal.copyWith(
                                color: AppColor.purple,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              projectsModel.description ?? "",
                              style: poppinsMediumSmall.copyWith(
                                color: AppColor.purple,
                                fontSize: 10,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "Due: ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.purple,
                                  ),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  projectsModel.endDate != null &&
                                          projectsModel.endDate!.length >= 10
                                      ? projectsModel.endDate!.substring(0, 10)
                                      : " ",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColor.purple,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
