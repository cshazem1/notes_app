import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';

import 'constants.dart';

void main() async{
  await Hive.initFlutter();
 await Hive.openBox(kNotesName);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NotesView.id:(context) => const NotesView(),
        EditNoteView.id:(context) => const EditNoteView(),

      },
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.dark,fontFamily:"Poppins"),
      initialRoute: NotesView.id,
    );
  }
}
