import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/modules/view_note_screen/controllers/view_note_screen_controller.dart';
import 'package:notes/constants/string_cont.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isClicked, required this.color});
  final bool isClicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isClicked
        ? CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 36,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  final ViewNoteScreenController controller =
      Get.find<ViewNoteScreenController>();

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
                controller.color.value = kColors[index].value;

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
