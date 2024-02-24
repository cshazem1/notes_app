import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/widgets/custom_icon.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';
import '../views/edit_note_view.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {

        widget.noteModel.delete();
        BlocProvider.of<NotesCubit>(context).fetchNotes();



      },
      onResize: () {

      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: const CustomIcon(
            icon: Icon(Icons.delete, color: Colors.black), opacity: .4),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const CustomIcon(
            icon: Icon(Icons.delete, color: Colors.black), opacity: .4),
      ),
      key:  Key("${DateFormat("yyyy-MM-dd HH:mm:ss:mms").format(DateTime.now())}:${DateTime.now().microsecondsSinceEpoch}"
          ),
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Color(widget.noteModel.color),
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
                  Navigator.pushNamed(context, EditNoteView.id,
                      arguments: widget.noteModel);
                },
              ),
              title: Text(widget.noteModel.title,
                  style: const TextStyle(color: Colors.black, fontSize: 26)),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(widget.noteModel.description,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.6), fontSize: 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                widget.noteModel.date,
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
