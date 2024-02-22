import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/add_note_cubit/add_note_state.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNotesState>(
            listener: (context, state) {
              if (state is AddNotesFailure) {
                print("failed${state.message}");
              } else if (state is AddNotesSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return const SingleChildScrollView(
                child: AddNoteForm(),
              );
            },
          ),
        ),
      ),
    );
  }
}
