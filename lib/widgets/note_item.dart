

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';
import '../views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
   const NoteItem({super.key,required this.noteModel});
final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(context,EditNoteView.id);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16),
        margin:const EdgeInsets.symmetric(vertical: 4) ,
        decoration: BoxDecoration(
            color:  Color(noteModel.color), borderRadius: BorderRadius.circular(16)),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              trailing: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.delete, color: Colors.black,size: 35,),
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                },
              ),
              title:  Text(noteModel.title,
                  style:const TextStyle(color: Colors.black, fontSize: 26)),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(noteModel.description,
                    style: TextStyle(color: Colors.black.withOpacity(.6), fontSize: 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
               noteModel.date,
                style: TextStyle(color: Colors.black.withOpacity(.6),fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
