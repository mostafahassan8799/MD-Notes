import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes/app/modules/view_note_screen/controllers/view_note_screen_controller.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/colors_list_view.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  final ViewNoteScreenController noteController =
      Get.put(ViewNoteScreenController()); // GetX controller

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            hint: 'title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 8),
          const ColorsListView(),
          Obx(() => CustomButton(
                isLoading:
                    noteController.isLoading.value, // Use GetX loading state
                onTap: () {
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat('dd/MM/yyyy').format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formattedCurrentDate,
                      color: Colors.blue.value,
                      isChecked: false,
                    );

                    noteController.addNote(noteModel); // Use GetX addNote
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              )),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
