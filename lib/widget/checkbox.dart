import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class RememberMeCheckbox extends StatefulWidget {
  final void Function(bool) onRememberChanged;
  const RememberMeCheckbox({super.key, required this.onRememberChanged});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          isRemember = !isRemember;
        });

        widget.onRememberChanged(isRemember);
      },
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
                color: isRemember ? AppColor.primarycolor : null,
                borderRadius: BorderRadius.circular(6),
                border: !isRemember
                    ? Border.all(color: const Color(0xFFB6B6B8))
                    : null),
            child: isRemember
                ? const Icon(Icons.done, size: 14, color: AppColor.purple)
                : null,
          ),
          const SizedBox(width: 10),
          Text(
            'Remember',
            style: poppinsRegularNormal.copyWith(
                color: AppColor.purple, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
