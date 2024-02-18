import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget{
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,),
        child: Column(
          children: [
            CustomTextField(

              hintText: "Enter Your Title",
              labelText: "Title",
              onSubmitted: (p0) {
            }, onChange: (p0) {

            },),
            CustomTextField(
              height: 100,
              onSubmitted: (p0) {

            }, onChange: (p0) {

            },)
          ],


        ),
      );

  }
}