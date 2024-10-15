import 'package:get/get.dart';

import '../modules/edit_note_screen/bindings/edit_note_screen_binding.dart';
import '../modules/edit_note_screen/views/edit_note_screen_view.dart';
import '../modules/view_note_screen/bindings/view_note_screen_binding.dart';
import '../modules/view_note_screen/views/view_note_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.VIEW_NOTE_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.VIEW_NOTE_SCREEN,
      page: () => const ViewNoteScreenView(),
      binding: ViewNoteScreenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_NOTE_SCREEN,
      page: () => const EditNoteScreenView(),
      binding: EditNoteScreenBinding(),
    ),
  ];
}
