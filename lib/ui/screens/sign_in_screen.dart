import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/forgot_password_email_screen.dart';
import 'package:task_management/ui/screens/sign_up_screen.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                "Get Started With",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              TextFormField(decoration: InputDecoration(hintText: 'Email')),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
              const SizedBox(height: 8),
              //elevated button na egula, filled button
              FilledButton(
                onPressed: _onTapSignInButton,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: _onTapForgotPasswordButton,
                      child: Text('Forgot Passowrd?'),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          // letterSpacing: 0.5,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(color: Colors.green),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = _onTapSignUpButton,
                            //.. - cascade notation - direct access korar jonno kono property,akta dot diye access, 2 ta dot diye initialize
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {}
  void _onTapForgotPasswordButton() {
    Navigator.pushNamed(context, ForgotPasswordEmailScreen.name);
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }
}


//infinity - choltei thakbe
//maxfinite - jototuku jete parbe tototuku jabe