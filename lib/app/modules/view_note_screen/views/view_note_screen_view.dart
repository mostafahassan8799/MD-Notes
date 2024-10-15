import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_note_screen_controller.dart';

class ViewNoteScreenView extends GetView<ViewNoteScreenController> {
  const ViewNoteScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewNoteScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewNoteScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
