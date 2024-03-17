import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  MaterialStateProperty<OutlinedBorder?>? shape;
  Widget? child;
  Function? function;
  String? buttonTitle;
  Color? backgroundColor;
  CustomButtonWidget({this.child,this.shape,this.function,this.buttonTitle, this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all( Size(MediaQuery.of(context).size.width * 0.9, 42)),
          shape: shape ?? MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),
          )),
         backgroundColor: MaterialStateProperty.all(backgroundColor)
      ),
      onPressed:()=> function!(),
      child: child ?? Text(buttonTitle??"",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}