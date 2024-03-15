import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/features/feature_to_do/presentation/widget/groups_list.dart';
import 'package:trudo/features/feature_to_do/presentation/widget/to_do_app_appbar_screen.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/custom_text_form_field.dart';

class ToDoAppScreen extends StatefulWidget {
  const ToDoAppScreen({super.key});

  @override
  State<ToDoAppScreen> createState() => _ToDoAppScreenState();
}

class _ToDoAppScreenState extends State<ToDoAppScreen> {
  bool isSearchContainerVisible = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isSearchContainerVisible = false;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          isSearchContainerVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          ToDoAppAppBar(
            onPressed: () {
              setState(() {
                isSearchContainerVisible = !isSearchContainerVisible;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isSearchContainerVisible ? 60 : 0,
            curve: Curves.easeInOut,
            child: Container(
              color: AppColor.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextFormField(
                  onEditingComplete: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                    });
                  },
                  onChange: (value) {},
                  cursorColor: AppColor.primarycolor,
                  hintStyle: const TextStyle(color: AppColor.grifortext),
                  hintText: 'Search Group',
                  prefixIcon: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isSearchContainerVisible ? 28 : 0,
                    height: isSearchContainerVisible ? 28 : 0,
                    curve: Curves.easeInOut,
                    child: const Icon(
                      Icons.search,
                      color: AppColor.grifortext,
                      size: 28,
                    ),
                  ),
                  style: const TextStyle(color: AppColor.purple, fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              color: AppColor.black,
              shadowColor: Colors.black,
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return const GroupsList();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
