import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class AddNewActionPiplineScreen extends StatelessWidget {
  const AddNewActionPiplineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black, body: AddNewActionBody());
  }
}

class AddNewActionBody extends StatelessWidget {
  const AddNewActionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CusttomAppBarAddAction(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'Add New Action',
          ),
          const Expanded(
            child: FormListAddNewActoin(),
          ),
        ],
      ),
    );
  }
}

class FormListAddNewActoin extends StatelessWidget {
  const FormListAddNewActoin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DropdownButtonFormField<String>(
                style: const TextStyle(color: AppColor.grifortext),
                decoration: InputDecoration(
                  hintText: 'Contact',
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
                    borderSide: BorderSide(
                        color: AppColor.primarycolor.withOpacity(0.4)),
                  ),
                ),
                onChanged: (String? newValue) {},
                items: <String>[
                  'Yusuf Darwish',
                  'Mohammed Sallal',
                  'Faruk Nakib',
                  'Yaman Turkmen',
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
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: AppColor.purple),
                      decoration: InputDecoration(
                        hintText: 'Time Range',
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
                        hintText: 'Date',
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
              child: DropdownButtonFormField<String>(
                style: const TextStyle(color: AppColor.grifortext),
                decoration: InputDecoration(
                  hintText: 'Action Result',
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
                    borderSide: BorderSide(
                        color: AppColor.primarycolor.withOpacity(0.4)),
                  ),
                ),
                onChanged: (String? newValue) {},
                items: <String>[
                  'Closed',
                  'Never',
                  'Follow',
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
                  hintText: 'Feelings',
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
                    borderSide: BorderSide(
                        color: AppColor.primarycolor.withOpacity(0.4)),
                  ),
                ),
                onChanged: (String? newValue) {},
                items: <String>[
                  'Happy',
                  'Maybe',
                  'Sad',
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
                  hintText: 'Description ... ',
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
                    borderSide: BorderSide(
                        color: AppColor.primarycolor.withOpacity(0.4)),
                  ),
                ),
                maxLines: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CusttomAppBarAddAction extends StatelessWidget {
  const CusttomAppBarAddAction({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 30,
        ),
        Text(
          title,
          style: poppinsSemiBoldLarge.copyWith(color: AppColor.purple),
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
