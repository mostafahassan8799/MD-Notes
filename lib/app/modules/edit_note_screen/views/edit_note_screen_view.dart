import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notes/widgets/edit_view_body.dart';

import '../controllers/edit_note_screen_controller.dart';

class EditNoteScreenView extends GetView<EditNoteScreenController> {
  const EditNoteScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: Get.arguments,
      ),
    );
  }
}
