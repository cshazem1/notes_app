import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/custom_icon.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';
import '../views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        noteModel.delete();
        BlocProvider.of<NotesCubit>(context).fetchNotes();
      },
      onResize: () {

      },

      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: CustomIcon(icon: Icon(Icons.delete,color: Colors.black),opacity: .4),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerRight,
        child: CustomIcon(icon: Icon(Icons.delete,color: Colors.black),opacity: .4),
      ),
      key: Key("value"),
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              trailing: CustomIcon(
                opacity: .4,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, EditNoteView.id, arguments: noteModel);

                },
              ),
              title: Text(noteModel.title,
                  style: const TextStyle(color: Colors.black, fontSize: 26)),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(noteModel.description,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.6), fontSize: 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                noteModel.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(.6), fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
