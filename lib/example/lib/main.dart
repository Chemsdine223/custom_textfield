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

/// Demonstrates the usage of CustomInput in a basic UI.
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
      appBar: AppBar(
        title: Text('Custom TextField'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextfield(
            controller: _controller,
            focusNode: _focusNode,
            hintText: 'Enter your name',
            label: 'Full Name',
            title: 'Name',
            maxLength: 50,
            keyboardType: TextInputType.name,
            prefixIcon: Icon(Icons.person),
            suffixIcon: Icon(Icons.check_circle_outline),
            onChanged: (value) => debugPrint('Input changed: $value'),
            validator: (value) =>
                value != null && value.length < 3 ? 'Too short' : null,
            requestErrorText: 'Server rejected input',
            requestError: false,
            enableCounter: true,
            fontWeight: FontWeight.w500,
            hintFontWeight: FontWeight.w300,
            errorFontWeight: FontWeight.w600,
            fonSize: 16,
            errorFonSize: 12,
            hintFonSize: 14,
            titleFonSize: 15,
            backgroundColor: Colors.white,
            focusedBorderColor: Colors.blue,
            unfocusedBorderColor: Colors.grey,
            errorBorderColor: Colors.red,
            cursorColor: Colors.black,
            borderRadius: 12,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
