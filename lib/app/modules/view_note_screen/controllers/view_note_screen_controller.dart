import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/constants/string_cont.dart';
import 'package:notes/models/note_model.dart';

class ViewNoteScreenController extends GetxController {
  final color = 0.obs;

  final notes = [].obs;
  final isLoading = false.obs;
  var noteBox = Hive.box<NoteModel>(kNotesBox);

  addNote(NoteModel noteModel) async {
    try {
      await noteBox.add(noteModel);
    } catch (e) {
      throw e.toString();
    }
  }

  fetchAllNotes() async {
    notes.assignAll(noteBox.values.toList());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    color.value = const Color(0xFFFFD700).value;
    fetchAllNotes();
  }
}
