import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';

import 'add_note_state.dart';

class AddNoteCuibt  extends Cubit<AddNotesState>{
  AddNoteCuibt() :super(AddNotesInitial());
  addNote(NoteModel noteModel) async {
    emit(AddNotesLoading());
  try {
    var notesBox=  Hive.box<NoteModel>("kNotesName");
 await   notesBox.add(noteModel);
    emit(AddNotesSuccess());

  }  catch (e) {
    emit(AddNotesFailure(e.toString()));
  }


  }
}