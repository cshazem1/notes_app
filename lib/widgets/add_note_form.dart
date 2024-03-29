import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';
import '../constants.dart';
import '../helper/animated_snack_bar.dart';
import 'custom_color_picker.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}
class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  String? title;
  String? description;
  int? color;
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ColorPickerPage(
              changColor: (data) {
                color = data.value;
                log(color.toString());
              },
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNoteCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                text: "Add",
                onClick: () {
                  if (globalKey.currentState!.validate()) {
                    {
                      buildAnimatedSnackBar("The note has been added successfully").show(context);
                      var currentDate = DateTime.now();
                      var formatCurrentDate =
                          DateFormat("yyyy-MM-dd hh:mm").format(currentDate);
                      globalKey.currentState!.save();
                      BlocProvider.of<AddNoteCubit>(context).addNote(NoteModel(
                          title: title!,
                          description: description!,
                          color: color ?? Colors.blue.value,
                          date: formatCurrentDate.toString()));
                    }
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                color: kPrimaryColor,
              );
            },
          )
        ],
      ),
    );
  }

}