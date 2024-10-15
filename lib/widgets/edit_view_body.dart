import 'package:flutter/material.dart';
import 'package:notes/constants/string_cont.dart';
import 'package:notes/models/note_model.dart';

import 'custom_text_field.dart';

import 'colors_list_view.dart';
import 'custom_app_bar.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: widget.note.subTitle,
              maxLines: 5,
              onChanged: (value) {
                content = value;
              },
            ),
            EditNoteColorList(
              noteModel: widget.note,
            ),
            const SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = kColors.indexOf(Color(widget.noteModel.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.noteModel.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                isClicked: currentIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
