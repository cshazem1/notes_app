import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';

import 'constants.dart';
import 'models/note_model.dart';

void main() async{
  await Hive.initFlutter();
 await Hive.openBox(kNotesName);
 Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit(),)
      ],
      child: MaterialApp(
        routes: {
          NotesView.id:(context) => const NotesView(),
          EditNoteView.id:(context) => const EditNoteView(),
      
        },
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark,fontFamily:"Poppins"),
        initialRoute: NotesView.id,
      ),
    );
  }
}
