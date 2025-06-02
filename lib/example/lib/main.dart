import 'package:custom_textfield_input/custom_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the example app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Input Example',
      home: const ExampleScreen(),
    );
  }
}

/// Demonstrates the usage of CustomTextfield in a basic UI.
class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Textfield Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomTextField(
          controller: _controller,
          focusNode: _focusNode,
          label: 'Email',
          title: 'Email Address',
          hintText: 'example@example.com',
          onChanged: (value) => print('Input changed: \$value'),
          validator: (value) {
            if (value == null || !value.contains('@')) {
              return 'Enter a valid email';
            }
            return null;
          },
          fontWeight: FontWeight.w500,
          hintFontWeight: FontWeight.w300,
          errorFontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
