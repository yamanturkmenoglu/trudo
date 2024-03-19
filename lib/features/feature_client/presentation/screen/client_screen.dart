import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/features/feature_client/presentation/widget/client_card.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_users_cubit/users_cubit_cubit.dart';
import 'package:trudo/features/features_project&tasks/cubit/projects/get_users_cubit/users_cubit_state.dart';
import 'package:trudo/features/features_project&tasks/presentation/widget/custom_text_form_field.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  bool isSearchContainerVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                'Clients',
                style:
                    poppinsSemiBoldExtraLarge.copyWith(color: AppColor.purple),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchContainerVisible = !isSearchContainerVisible;
                    });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: AppColor.grifortext,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
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
                hintText: 'Search Client',
                prefixIcon: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isSearchContainerVisible ? 1 : 0,
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
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: BlocBuilder<AllUsersCubit, AllUsersState>(
            builder: (context, state) {
              if (state is AllUsersDone) {
                return ListView.builder(
                    itemCount: state.users.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return ClientCard(
                        allUsersModel: user,
                      );
                    });
              }
              return const SizedBox();
            },
          ),
        )
      ],
    ));
  }
}
