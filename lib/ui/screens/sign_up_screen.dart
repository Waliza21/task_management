import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              SizedBox(height: 60),
              Text(
                "Join With Us",
                style: Theme.of(context).textTheme.titleLarge,
                ///theme e jeta define kore ashchi sheta overwrite korte chaile
                // style: Theme.of(context).textTheme.titleLarge?.copyWith(
                //   fontWeight: FontWeight.w900,
                // ),
              ),
              SizedBox(height: 8),
              TextFormField(decoration: InputDecoration(hintText: "Email")),
              TextFormField(
                decoration: InputDecoration(hintText: "First Name"),
              ),
              TextFormField(decoration: InputDecoration(hintText: "Last Name")),
              TextFormField(decoration: InputDecoration(hintText: "Mobile")),
              TextFormField(decoration: InputDecoration(hintText: "Password")),
              SizedBox(height: 8),
              FilledButton(
                onPressed: _onTapSignUpButton,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(color: Colors.green),
                        recognizer:
                            TapGestureRecognizer()..onTap = _onTapSignInButton,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _onTapSignUpButton() {}
}
