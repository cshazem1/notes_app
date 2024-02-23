import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback onClick;
  final Color? color;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onClick,
      this.color,
      this.isLoading = false});
  final bool isLoading;

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.only(left: 50, right: 50, top: 10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
              spreadRadius: 1, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 4), // Offset
            ),
          ],
          color: color ?? Colors.blue,
          borderRadius: const BorderRadius.all(
            Radius.elliptical(40, 25),
          ),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
      ),
    );
  }
}
