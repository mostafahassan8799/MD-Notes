import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_note_screen_controller.dart';

class EditNoteScreenView extends GetView<EditNoteScreenController> {
  const EditNoteScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditNoteScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditNoteScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
