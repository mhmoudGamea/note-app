import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/read_cubit/read_note_cubit.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/icon_widget.dart';
import '../widgets/list_generate_widget.dart';

class NoteView extends StatefulWidget {
  static const String rn = '/';

  const NoteView({Key? key}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  void show(BuildContext context) {
    showModalBottomSheet(
      //isScrollControlled: true, // used to set all the bottomSheet above the keyboard
      context: context,
      builder: (context) {
        return const BottomSheetWidget();
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<ReadNoteCubit>(context).fetchAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarWidget(
          title: 'Notes',
          icon: 'assets/images/search-normal-1.svg',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: const [
            Expanded(
              child: ListGenerateWidget(),
            )
          ],
        ),
      ),
      floatingActionButton: IconWidget(
        icon: 'assets/images/edit-2.svg',
        color: Colors.green,
        size: 22,
        padding: 12,
        function: () {
          show(context);
        },
      ),
    );
  }
}
