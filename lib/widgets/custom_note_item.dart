import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes});
  final NoteModel notes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => EditNoteView(
        //         editModel: notes,
        //       ),
        //     ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
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
                  // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
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
