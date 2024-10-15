import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/constants/string_cont.dart';
import 'package:notes/models/note_model.dart';

class ViewNoteScreenController extends GetxController {
  Color color = const Color(0xFFFFD700);
  final notes = [].obs;
  final isLoading = false.obs;

  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(noteModel);
    } catch (e) {
      throw e.toString();
    }
  }
}
