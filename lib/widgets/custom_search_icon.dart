import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget{
   const CustomSearchIcon({required this.icon,super.key});
   final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(.05)),
      child:  Center(child: icon),
    );
  }
}