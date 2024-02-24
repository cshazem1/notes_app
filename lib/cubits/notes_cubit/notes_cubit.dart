import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';
import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? list;

  fetchNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesName);
    list = notesBox.values.toList();
    emit(NotesSuccess());

  }
  fetchNodeBySearch(String  text){
    List<NoteModel>data=[];
    var notesBox = Hive.box<NoteModel>(kNotesName);
    list = notesBox.values.toList();
 for(int i=0;i<list!.length;i++)
   {
     if(list![i].title.toLowerCase().contains(text.toLowerCase())||list![i].description.toLowerCase().contains(text.toLowerCase())){
       data.add(list![i]);
     }}
     list=data;
 emit(NotesSuccess());





  }
}
