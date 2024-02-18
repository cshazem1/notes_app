import 'package:flutter/material.dart';

import '../widgets/nodes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
        tooltip: "add",
        splashColor: Colors.orange,

        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add),

      ),
      body: const NotesViewBody(),
    );
  }
}
