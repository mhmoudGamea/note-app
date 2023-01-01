import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/cubit/read_cubit/read_note_cubit.dart';

import '../views/edit_note_view.dart';
import '../models/note_model.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel noteModel;
  const NoteWidget({Key? key, required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(EditNoteView.rn, arguments: noteModel);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  noteModel.name,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
                ),
              ),
              subtitle: Text(noteModel.description,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(height: 1.3, letterSpacing: 1, color: Colors.grey.shade600)),
              trailing: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<ReadNoteCubit>(context).fetchAll();
                },
                icon: SvgPicture.asset('assets/images/trash.svg', color: Colors.red.shade400),
              ),
            ),
            Text(noteModel.date, style: TextStyle(color: Colors.grey.shade600),)
          ],
        ),
      ),
    );
  }
}
