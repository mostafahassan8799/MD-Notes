import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/modules/view_note_screen/controllers/view_note_screen_controller.dart';
import 'package:notes/widgets/add_note_form.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.controller});
  final ViewNoteScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Obx(() {
        return AbsorbPointer(
          absorbing: controller.isLoading.value,
          child: const SingleChildScrollView(
            child: AddNoteForm(),
          ),
        );
      }),
    );
  }
}
