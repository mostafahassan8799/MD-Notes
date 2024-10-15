import 'package:flutter/material.dart';
import 'package:notes/app/modules/view_note_screen/controllers/view_note_screen_controller.dart';

import 'custom_note_item.dart';

class NotesViewList extends StatelessWidget {
  const NotesViewList({super.key, required this.controller});
  final ViewNoteScreenController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.notes.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: NoteItem(
              notes: controller.notes[index],
            ),
          );
        });
  }
}
