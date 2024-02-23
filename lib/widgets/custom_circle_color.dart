import 'package:flutter/material.dart';


class CustomCircleColor extends StatelessWidget {
 final Color color;
 final  double diameter;
 final VoidCallback call;
  const CustomCircleColor(
      {super.key, required this.color, required this.diameter,required this.call});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:call ,
      child: Container(
        height: diameter,
        width: diameter,
        decoration:  BoxDecoration(

            color: color,
            borderRadius:const BorderRadius.all(Radius.circular(100))),
        child: const Icon(Icons.colorize_rounded),
      )
      ,
    );
  }
}
