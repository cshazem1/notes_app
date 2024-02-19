import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget{
  const EditNoteView({super.key});
  static String id="EditNoteView";
  @override
  Widget build(BuildContext context) {
   return const Scaffold(body: EditNoteViewBody(),);
  }

}