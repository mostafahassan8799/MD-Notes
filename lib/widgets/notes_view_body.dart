import 'package:flutter/material.dart';
import 'package:notes/app/modules/view_note_screen/controllers/view_note_screen_controller.dart';
import 'custom_app_bar.dart';
import 'notes_view_list.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key, required this.controller});
  final ViewNoteScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          const CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          Expanded(
              child: NotesViewList(
            controller: controller,
          )),
          const SizedBox(
            height: 38,
          )
        ],
      ),
    );
  }
}
