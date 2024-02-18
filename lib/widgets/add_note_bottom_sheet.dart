import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget{
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
        child: Column(
          children: [
            CustomTextField(

              hintText: "Enter Your Title",
              labelText: "Title",
              onSubmitted: (p0) {
            }, onChange: (p0) {

            },),
            CustomTextField(
              hintText: "Enter Your Description",
              labelText: "Description",
              maxLine: 5,
              onSubmitted: (p0) {

            }, onChange: (p0) {

            },),
            CustomButton(text: "Add", onClick: (){},color: kPrimaryColor,)
          ],


        ),
      );

  }
}