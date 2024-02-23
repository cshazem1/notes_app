
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;
  String? desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
           CustomAppBar(
callback: () {
   widget.noteModel.title=title??widget.noteModel.title;
   widget.noteModel.description=desc??widget.noteModel.description;
   widget.noteModel.save();
   BlocProvider.of<NotesCubit>(context).fetchNotes();
   Navigator.pop(context);

},
            icon: const Icon(Icons.check),
            appBarName: "Edit Note",
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            onSubmitted: (data) {
              title = data;
            },
            onChange: (data) {
              title = data;

            },
            hintText: widget.noteModel.title,
            labelText: "Title",
          ),
          CustomTextField(
              onSubmitted: (data) {
                desc = data;
              },
              onChange: (data) {
                desc = data;

              },
              hintText: widget.noteModel.description,
              labelText: "Description",
              maxLine: 5),
        ],
      ),
    );
  }
}
