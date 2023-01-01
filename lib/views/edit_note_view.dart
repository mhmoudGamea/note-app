import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/read_cubit/read_note_cubit.dart';
import '../models/note_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/color_list_widget.dart';
import '../widgets/text_field_widget.dart';

class EditNoteView extends StatefulWidget {
  static const String rn = '/edit_note_view';

  const EditNoteView({Key? key}) : super(key: key);

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? _name;
  String? _desc;
  String? _date;
  int? _color;

  void receiveDate(value) {
    _date = value;
  }

  @override
  Widget build(BuildContext context) {
    NoteModel noteModel = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarWidget(
            title: 'Edit Note',
            icon: 'assets/images/add.svg',
            function: () async {
              noteModel.name = _name ?? noteModel.name;
              noteModel.description = _desc ?? noteModel.description;
              noteModel.date = _date ?? noteModel.date;
              noteModel.color = _color ?? noteModel.color;
              BlocProvider.of<ReadNoteCubit>(context).fetchAll();
              await noteModel.save();
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TextFieldWidget(
                hint: 'Note Name',
                onChange: (value) {
                  _name = value;
                },
              ),
              const SizedBox(height: 15),
              TextFieldWidget(
                hint: 'Add Description',
                maxLines: 5,
                onChange: (value) {
                  _desc = value;
                },
              ),
              const SizedBox(height: 15),
              TextFieldWidget(
                hint: 'Add Date',
                suffixIcon: 'assets/images/calendar.svg',
                datePicker: receiveDate,
              ),
              const SizedBox(height: 15),
              ColorListWidget(
                  onEditingMode: true,
                  color: noteModel.color,
                  pickedColor: (color) {
                    _color = color;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
