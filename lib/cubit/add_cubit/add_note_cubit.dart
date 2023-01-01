import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'add_note_state.dart';
import '../../models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  // add user note
  void addNote(NoteModel noteModel) async{
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccess());
    }catch (e) {
      emit(AddNoteError(error: e.toString()));
    }
  }

}