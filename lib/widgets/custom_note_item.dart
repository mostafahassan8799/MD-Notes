import 'package:flutter/material.dart';
import 'package:notes/app/modules/view_note_screen/controllers/view_note_screen_controller.dart';
import 'package:notes/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes, required this.controller});
  final NoteModel notes;
  final ViewNoteScreenController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: notes.isChecked ? Color(0xFFD3D3D3) : Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              leading: Checkbox(
                value: notes.isChecked,
                onChanged: (value) {
                  notes.isChecked = value ?? false;
                  notes.save();
                  controller.notes.refresh();
                },
              ),
              title: Text(
                notes.title,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Text(
                  notes.subTitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.6), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  notes.delete();
                  controller.notes.remove(notes);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                ),
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                notes.date,
                style: TextStyle(color: Colors.black.withOpacity(.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
