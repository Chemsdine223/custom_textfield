import 'package:custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();

    return CustomTextfield(
      controller: controller,
      focusNode: focusNode,
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
    );
  }
}
