import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/sign_in_screen.dart';
import 'package:task_management/ui/screens/sign_up_screen.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  static const String name = '/forgot-password-email';

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing:
                8, //column er prottekta content er moddhekar space er jonno spacing use hoy
            children: [
              const SizedBox(height: 60),
              Text(
                "Your Email Address",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "A 6 digits verification OTP will be sent to your email address",
                // style: Theme.of(context).textTheme.bodyMedium, //default ei body medium deya thake
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              TextFormField(decoration: InputDecoration(hintText: 'Email')),
              const SizedBox(height: 8),
              //elevated button na egula, filled button
              FilledButton(
                onPressed: _onTapSubmitButton,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      // letterSpacing: 0.5,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(color: Colors.green),
                        recognizer:
                            TapGestureRecognizer()..onTap = _onTapSignInButton,
                        //.. - cascade notation - direct access korar jonno kono property,akta dot diye access, 2 ta dot diye initialize
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

  void _onTapSubmitButton() {}
}


//infinity - choltei thakbe
//maxfinite - jototuku jete parbe tototuku jabe