import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/read_cubit/read_note_cubit.dart';

import './form_widget.dart';
import '../constants.dart';
import '../cubit/add_cubit/add_note_cubit.dart';
import '../cubit/add_cubit/add_note_state.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddNoteCubit>(
      create: (context) => AddNoteCubit(),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: secondaryDark),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteError) {
              debugPrint('Failed');
            }
            if (state is AddNoteSuccess) {
              BlocProvider.of<ReadNoteCubit>(context).fetchAll();
              Navigator.pop(context);
              debugPrint('Success');
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: FormWidget(),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
