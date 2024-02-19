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
            ,),SizedBox(height: 50,),
          CustomTextField(onSubmitted: (p0) {

          }, onChange: (p0) {

          },hintText: "Title",labelText: "Enter Your Title",),
        CustomTextField(onSubmitted: (p0) {

        }, onChange: (p0) {

        },hintText: "Description",labelText: "Enter Your Description",maxLine: 5),

        ],
      ),
    );
  }

}