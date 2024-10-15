import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notes/widgets/custom_bottom_sheet.dart';
import 'package:notes/widgets/notes_view_body.dart';

import '../controllers/view_note_screen_controller.dart';

class ViewNoteScreenView extends GetView<ViewNoteScreenController> {
  const ViewNoteScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const CustomBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: NotesViewBody(
        controller: controller,
      ),
    );
  }
}
