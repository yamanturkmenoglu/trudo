// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class AddNewContactsScreen extends StatelessWidget {
  const AddNewContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColor.black, body: AddNewContactsBody());
  }
}

class AddNewContactsBody extends StatelessWidget {
  const AddNewContactsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CusttomAddContactAppBar(
            title: 'Add New contacts',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Expanded(
          child: ListView(
            children: const <Widget>[AddForm()],
          ),
        ),
      ],
    );
  }
}

class CusttomAddContactAppBar extends StatelessWidget {
  const CusttomAddContactAppBar({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.users,
              color: AppColor.purple,
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                title,
                style: poppinsSemiBoldLarge.copyWith(color: AppColor.purple),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColor.lightblack,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.done,
              color: AppColor.purple,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class AddForm extends StatelessWidget {
  const AddForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(color: AppColor.purple),
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: poppinsMediumNormal.copyWith(
                        color: AppColor.grifortext),
                    filled: true,
                    fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                    focusColor: AppColor.primarycolor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppColor.primarycolor.withOpacity(0.4)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  style: const TextStyle(color: AppColor.purple),
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: poppinsMediumNormal.copyWith(
                        color: AppColor.grifortext),
                    filled: true,
                    fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                    focusColor: AppColor.primarycolor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppColor.primarycolor.withOpacity(0.4)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            style: const TextStyle(color: AppColor.purple),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle:
                  poppinsMediumNormal.copyWith(color: AppColor.grifortext),
              filled: true,
              fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
              focusColor: AppColor.primarycolor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor.primarycolor.withOpacity(0.4)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            style: const TextStyle(color: AppColor.purple),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Phone',
              hintStyle:
                  poppinsMediumNormal.copyWith(color: AppColor.grifortext),
              filled: true,
              fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
              focusColor: AppColor.primarycolor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor.primarycolor.withOpacity(0.4)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  style: const TextStyle(color: AppColor.grifortext),
                  decoration: InputDecoration(
                    hintText: 'Company',
                    hintStyle: poppinsMediumNormal.copyWith(
                        color: AppColor.grifortext),
                    filled: true,
                    fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                    focusColor: AppColor.primarycolor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppColor.primarycolor.withOpacity(0.4)),
                    ),
                  ),
                  onChanged: (String? newValue) {},
                  items: <String>[
                    'General',
                    'Development',
                    'Desgin',
                    'Marketing',
                    'Other',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  style: const TextStyle(color: AppColor.purple),
                  decoration: InputDecoration(
                    hintText: 'Position',
                    hintStyle: poppinsMediumNormal.copyWith(
                        color: AppColor.grifortext),
                    filled: true,
                    fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
                    focusColor: AppColor.primarycolor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppColor.primarycolor.withOpacity(0.4)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            style: const TextStyle(color: AppColor.purple),
            decoration: InputDecoration(
              hintText: 'Date Of Birth',
              hintStyle:
                  poppinsMediumNormal.copyWith(color: AppColor.grifortext),
              filled: true,
              fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
              focusColor: AppColor.primarycolor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor.primarycolor.withOpacity(0.4)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: DropdownButtonFormField<String>(
            style: const TextStyle(color: AppColor.grifortext),
            decoration: InputDecoration(
              hintText: 'Status',
              hintStyle:
                  poppinsMediumNormal.copyWith(color: AppColor.grifortext),
              filled: true,
              fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
              focusColor: AppColor.primarycolor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor.primarycolor.withOpacity(0.4)),
              ),
            ),
            onChanged: (String? newValue) {},
            items: <String>[
              'A1',
              'Fu',
              'B1',
              'T',
              'Other',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: DropdownButtonFormField<String>(
            style: const TextStyle(color: AppColor.grifortext),
            decoration: InputDecoration(
              hintText: 'Assigned To',
              hintStyle:
                  poppinsMediumNormal.copyWith(color: AppColor.grifortext),
              filled: true,
              fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
              focusColor: AppColor.primarycolor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor.primarycolor.withOpacity(0.4)),
              ),
            ),
            onChanged: (String? newValue) {},
            items: <String>[
              'Mohammed',
              'Fejer',
              'yaman',
              'Tesnim',
              'lara',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            style: const TextStyle(color: AppColor.purple),
            decoration: InputDecoration(
              hintText: 'Result  ',
              hintStyle:
                  poppinsMediumNormal.copyWith(color: AppColor.grifortext),
              filled: true,
              fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
              focusColor: AppColor.primarycolor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor.primarycolor.withOpacity(0.4)),
              ),
            ),
            maxLines: 3,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            style: const TextStyle(color: AppColor.purple),
            decoration: InputDecoration(
              hintText: 'Note  ',
              hintStyle:
                  poppinsMediumNormal.copyWith(color: AppColor.grifortext),
              filled: true,
              fillColor: const Color(0x3EFFFFFF).withOpacity(0.2),
              focusColor: AppColor.primarycolor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor.primarycolor.withOpacity(0.4)),
              ),
            ),
            maxLines: 3,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
