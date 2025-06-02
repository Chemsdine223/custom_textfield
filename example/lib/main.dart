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
      debugShowCheckedModeBanner: false,
      title: 'Custom TextField Example',
      home: const ExampleScreen(),
    );
  }
}

/// Demonstrates the usage of CustomTextField in a basic UI.
class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final _usernameController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: const Text('Custom TextField Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              CustomTextField(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(Icons.person),
                ),
                controller: _usernameController,
                focusNode: _usernameFocusNode,
                title: 'Username',
                titleFonSize: 12,
                fonSize: 16,
                hintText: 'Enter your username',
                onChanged: (value) => print('Input changed: \$value'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 10) {
                    return 'This field cannot be empty!';
                  }
                  return null;
                },
                fontWeight: FontWeight.w500,
                hintFontWeight: FontWeight.w300,
                errorFontWeight: FontWeight.w400,
              ),
              SizedBox(height: 16),
              CustomTextField(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(Icons.mail),
                ),
                controller: _emailController,
                focusNode: _emailFocusNode,
                label: 'Email',
                titleFonSize: 12,
                fonSize: 16,
                hintText: 'example@example.com',
                onChanged: (value) => print('Input changed: \$value'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter a valid email !';
                  }
                  return null;
                },
                fontWeight: FontWeight.w500,
                hintFontWeight: FontWeight.w300,
                errorFontWeight: FontWeight.w400,
              ),
              SizedBox(height: 16),
              CustomTextField(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(Icons.password),
                ),
                controller: passwordController,
                focusNode: passwordFocusNode,
                label: 'Password',
                titleFonSize: 12,
                fonSize: 16,
                hintText: 'Enter your password',
                onChanged: (value) => print('Input changed: \$value'),
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'Your password is too short !';
                  }
                  return null;
                },
                obscureText: true,
                fontWeight: FontWeight.w500,
                hintFontWeight: FontWeight.w300,
                errorFontWeight: FontWeight.w400,
                maxLength: 12,
                enableCounter: true,
              ),
              SizedBox(height: 26),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 46),
                  padding: EdgeInsets.symmetric(),
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                  // shape: BoxShape
                ),

                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
