import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import '../cubits/notes_cubit/notes_state.dart';
import '../models/note_model.dart';
import 'note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> list = BlocProvider.of<NotesCubit>(context).list ?? [];


          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: ListView.builder(
              itemCount: list.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return NoteItem(
                  noteModel: list[index],
                );
              },
            ),
          );

      },
    );
  }
}
