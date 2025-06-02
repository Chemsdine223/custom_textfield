import 'package:custom_textfield_input/custom_textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomTextField Widget Test', () {
    testWidgets('renders with hint and label text',
        (WidgetTester tester) async {
      final focusNode = FocusNode();
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hintText: 'Enter name',
              label: 'Name',
              controller: controller,
              focusNode: focusNode,
            ),
          ),
        ),
      );

      expect(find.text('Name'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
    });
    testWidgets('displays error text on validation failure',
        (WidgetTester tester) async {
      final focusNode = FocusNode();
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: CustomTextField(
                hintText: 'Enter name',
                label: 'Name',
                focusNode: focusNode,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      // Trigger validation manually
      formKey.currentState!.validate();
      await tester.pumpAndSettle();

      expect(find.text('Field is required'), findsOneWidget);
    });

    testWidgets('accepts text input and triggers onChanged',
        (WidgetTester tester) async {
      final focusNode = FocusNode();
      final controller = TextEditingController();
      String? capturedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hintText: 'Enter text',
              label: 'Text',
              controller: controller,
              focusNode: focusNode,
              onChanged: (value) {
                capturedValue = value;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Hello');
      expect(controller.text, 'Hello');
      expect(capturedValue, 'Hello');
    });
  });
}
