import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/add_cubit/add_note_state.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const ButtonWidget({Key? key, required this.text, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize:const Size(double.infinity, 50)
          ),
          onPressed: onPress,
          child: state is AddNoteLoading ? const CircularProgressIndicator(color: Colors.white) : Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17, letterSpacing: 1, fontFamily: 'Nunito'),
          ),
        );
      },
    );
  }
}
