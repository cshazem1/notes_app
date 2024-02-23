import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({required this.icon,this.opacity,this.onPressed, super.key});
  final Icon? icon;
  final double? opacity;
 final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(opacity??.05)),
        child: Center(child: icon),
      ),
    );
  }
}
