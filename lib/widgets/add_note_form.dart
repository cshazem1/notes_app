import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../constants.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  String? title;
  String? description;
  final GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: globalKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: "Enter Your Title",
            labelText: "Title",
            onSubmitted: (data) {
              title = data;
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
              description = data;
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
              if (globalKey.currentState!.validate()) {
                { globalKey.currentState!.save();
                  BlocProvider.of<AddNoteCubit>(context).addNote(NoteModel(title: title!, description: description!, color:  Colors.blue.value, date:TimeOfDay.now().toString()));
                }
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
