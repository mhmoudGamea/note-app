import 'package:flutter/material.dart';
abstract class AddNoteState{}

class AddNoteInitial extends AddNoteState{}
class AddNoteLoading extends AddNoteState{}
class AddNoteSuccess extends AddNoteState{}
class AddNoteError extends AddNoteState{
  final String error;
  AddNoteError({required this.error}) {
    debugPrint(error);
  }
}