import 'dart:core';

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  Function(String) onChange;
  Function(String) onSubmitted;
  String? initialText;
  String? hintText;
  String? labelText;
  bool? onClick;
  Icon? icon;
  bool? enable;
  double? height;
  CustomTextField(
      {super.key,
      required this.onSubmitted,
      this.initialText,
      this.height,
      this.enable,
      this.icon,
      this.hintText,
      this.labelText,
      required this.onChange,
      this.onClick});
  bool onView = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        enabled: enable,
        onSubmitted: onSubmitted,
        onChanged: onChange,
        decoration: InputDecoration(
            suffixIcon: icon,
            hintText: hintText,
            hintStyle: (TextStyle(color: Colors.white.withOpacity(.5))),
            labelText: labelText,
            labelStyle: (const TextStyle(fontSize: 18)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: kPrimaryColor)),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }
}
