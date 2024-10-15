import 'package:get/get.dart';

import '../controllers/view_note_screen_controller.dart';

class ViewNoteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewNoteScreenController>(
      () => ViewNoteScreenController(),
    );
  }
}
