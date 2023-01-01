import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/read_cubit/read_note_cubit.dart';
import 'package:notes_app/cubit/read_cubit/read_note_state.dart';
import 'package:notes_app/models/note_model.dart';

import './note_widget.dart';

class ListGenerateWidget extends StatelessWidget {
  const ListGenerateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNoteState>(
      builder: (context, state) {
        List<NoteModel> notesData = BlocProvider.of<ReadNoteCubit>(context).getNotes ?? [];
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: notesData.length,
          itemBuilder: (context, index) => NoteWidget(noteModel: notesData[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        );
      },
    );
  }
}
