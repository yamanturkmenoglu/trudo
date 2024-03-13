import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart'
    // ignore: library_prefixes
    as ProjectDetailsModel;

import 'package:trudo/features/features_project&tasks/presentation/widget/search_bar.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/task_card.dart';

class ReviewScreen extends StatefulWidget {
  final List<ProjectDetailsModel.Card>? cards;

  const ReviewScreen({Key? key, this.cards}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<ProjectDetailsModel.Card>? filteredCards;

  @override
  void initState() {
    filteredCards = widget.cards;
    super.initState();
  }

  void _filterCards(String query) {
    setState(() {
      filteredCards = widget.cards
          ?.where(
              (card) => card.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SearchBarTextFild(
            onChanged: _filterCards,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: filteredCards?.length ?? 0,
              itemBuilder: (context, index) {
                return TaskCard(
                  card: filteredCards![index],
                  onTap: () {
                    context.push(AppRoutes.taskDetailsScreen);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
