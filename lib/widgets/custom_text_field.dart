import 'dart:core';

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final Function(String) onChange;
  final void Function(String?)? onSubmitted;
  final String? initialText;
  final String? hintText;
  final String? labelText;
  final bool? onClick;
  final Icon? icon;
  final bool? enable;
  final int? maxLine;
  final bool onView = true;

  const CustomTextField(
      {super.key,
      required this.onSubmitted,
      this.initialText,
      this.maxLine,
      this.enable,
      this.icon,
      this.hintText,
      this.labelText,
      required this.onChange,
      this.onClick});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "field is required";
          } else {
            return null;
          }
        },
        maxLines: maxLine,
        enabled: enable,
        onSaved: onSubmitted,
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
