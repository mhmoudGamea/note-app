import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './button_widget.dart';
import './text_field_widget.dart';
import '../cubit/add_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import './color_list_widget.dart';
import '../constants.dart';

class FormWidget extends StatefulWidget {
  final bool isEditing;

  const FormWidget({Key? key, this.isEditing = false}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _form = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  String? _name;
  String? _desc;
  String? _date;
  int? _color;

  void receiveDate(value) {
    _date = value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      autovalidateMode: _autoValidate,
      child: Column(
        children: [
          TextFieldWidget(
            hint: 'Note Name',
            onSaved: (value) {
              _name = value;
            },
          ),
          const SizedBox(height: 15),
          TextFieldWidget(
            hint: 'Add Description',
            maxLines: 5,
            onSaved: (value) {
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
          SizedBox(
            width: double.infinity,
            child: ColorListWidget(
              pickedColor: (color) {
                _color = color;
              },
            ),
          ),
          const SizedBox(height: 10),
          if (!widget.isEditing)
            ButtonWidget(
              text: 'Add Note',
              onPress: () {
                if (_form.currentState!.validate()) {
                  _form.currentState!.save();
                  NoteModel noteModel = NoteModel(
                      name: _name!,
                      description: _desc!,
                      date: _date!,
                      color: _color ?? secondaryDark.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  setState(() {
                    _autoValidate = AutovalidateMode.always;
                  });
                }
              },
            ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
