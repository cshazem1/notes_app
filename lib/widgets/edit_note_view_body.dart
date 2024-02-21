import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget{
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:24),
      child: Column(
        children: [const CustomAppBar(icon: Icon(Icons.check),appBarName: "Edit Note"
            ,),const SizedBox(height: 50,),
          CustomTextField(onSubmitted: (p0) {

          }, onChange: (p0) {

          },hintText:"Enter Your Title",labelText: "Title" ,),
        CustomTextField(onSubmitted: (p0) {

        }, onChange: (p0) {

        },hintText:"Enter Your Description" ,labelText:"Description" ,maxLine: 5),

        ],
      ),
    );
  }

}