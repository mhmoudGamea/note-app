import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './cubit/read_cubit/read_note_cubit.dart';
import './constants.dart';
import './views/note_view.dart';
import './views/edit_note_view.dart';
import './models/note_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadNoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: '/',
        routes: {
          NoteView.rn: (context) => const NoteView(),
          EditNoteView.rn: (context) => const EditNoteView(),
        },
      ),
    );
  }
}
