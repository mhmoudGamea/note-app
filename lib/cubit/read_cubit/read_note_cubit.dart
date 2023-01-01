import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

import './read_note_state.dart';

class ReadNoteCubit extends Cubit<ReadNoteState> {
  ReadNoteCubit() : super(ReadNoteInitial());

  List<NoteModel>? _notes;

  List<NoteModel>? get getNotes {
    return _notes;
  }

  void fetchAll() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    _notes = notesBox.values.toList();
    emit(ReadNoteSuccess());
  }
}