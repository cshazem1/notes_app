import 'package:flutter/material.dart';

import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/nodes_view_body.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  static String id = "NotesView";

  @override
  State<NotesView> createState() => _NotesViewState();
}
class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
        tooltip: "add",
        splashColor: Colors.orange,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add),
      ),
      body:  NotesViewBody(),
    );
  }
}
