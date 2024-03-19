// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class ContactsDetailsScreen extends StatelessWidget {
  const ContactsDetailsScreen({super.key});

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: CusttomAddContactAppBar(
            title: 'Contacts Details',
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
                    hintText: 'Don Johe ',
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
                    hintText: 'Carless',
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
              hintText: 'Email@gmail.com',
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
              hintText: '+976 768 54 6 554',
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
                    hintText: 'Tsoft',
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
                    hintText: 'CEO',
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
              hintText: '03-03-1998',
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
              hintText: 'A1',
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
              hintText: 'Yaman Mung',
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
              hintText:
                  'Hint Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text',
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
              hintText:
                  'Note that the text field is not visible   to the user and the text field is not visible to the user  ',
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
