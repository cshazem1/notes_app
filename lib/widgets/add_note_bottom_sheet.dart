import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode? autoValidateMode =AutovalidateMode.disabled;
  String ?title;
  String? description;
 final GlobalKey<FormState> globalKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode:autoValidateMode ,
      key: globalKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: "Enter Your Title",
            labelText: "Title",
            onSubmitted: (data) {
              title=data;
              setState(() {
log(title!);
              });
            },
            onChange: (p0) {},
          ),
          CustomTextField(
            hintText: "Enter Your Description",
            labelText: "Description",
            maxLine: 5,
            onSubmitted: (data) {
              description=data;
              setState(() {
                log(description!);

              });
            },
            onChange: (p0) {},
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: "Add",
            onClick: () {
              if(globalKey.currentState!.validate())
              {
                globalKey.currentState!.save();
              }
              else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {

                });
              }
            },
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
