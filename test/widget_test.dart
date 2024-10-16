import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/app/modules/view_note_screen/controllers/view_note_screen_controller.dart';
import 'package:notes/app/modules/view_note_screen/views/view_note_screen_view.dart'; // Import this for Hive Flutter support

void main() async {
  // Ensure Hive is initialized before running tests
  TestWidgetsFlutterBinding
      .ensureInitialized(); // This line is crucial for Flutter tests

  setUpAll(() async {
    // Initialize Hive and open a box for your notes
    await Hive.initFlutter(); // Initialize Hive
    await Hive.openBox('notes'); // Open the box you plan to use
  });

  tearDownAll(() async {
    // Close the box after tests
    await Hive.box('notes').close();
  });

  setUp(() {
    // Initialize the GetX controller before each test
    Get.put(ViewNoteScreenController());
  });

  testWidgets('Add a note', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: ViewNoteScreenView()));

    // Add a note
    await tester.enterText(find.byType(TextField), 'Test Note');
    await tester.testTextInput
        .receiveAction(TextInputAction.done); // Simulate submission
    await tester.pump(); // Rebuild the widget

    // Assert: Check if the note was added
    expect(find.text('Test Note'), findsOneWidget);
    expect(Get.find<ViewNoteScreenController>().notes.length, 1);
  });

  testWidgets('Check a note', (WidgetTester tester) async {
    // Add a note first
    final controller = Get.find<ViewNoteScreenController>();
    controller.notes[0]('Test Note');

    // Build the widget
    await tester.pumpWidget(MaterialApp(home: ViewNoteScreenView()));

    // Check the newly added note
    await tester.tap(find.byType(Checkbox).first); // Click the checkbox
    await tester.pump(); // Rebuild the widget

    // Assert: Check if the checkbox is checked
    expect(controller.notes[0].isChecked, true);
  });
}
