import 'package:get/get.dart';

import '../controllers/edit_note_screen_controller.dart';

class EditNoteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditNoteScreenController>(
      () => EditNoteScreenController(),
    );
  }
}
