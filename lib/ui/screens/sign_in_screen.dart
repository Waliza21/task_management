import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/ui/providers/sign_in_provider.dart';
import 'package:task_management/ui/screens/forgot_password_email_screen.dart';
import 'package:task_management/ui/screens/main_bottom_nav_holder_screen.dart';
import 'package:task_management/ui/screens/sign_up_screen.dart';
import 'package:task_management/ui/widgets/screen_background.dart';
import 'package:task_management/ui/widgets/snackbar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode:
                  AutovalidateMode
                      .onUserInteraction, //user interaction e validate hobe
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
                  TextFormField(
                    controller: emailTEController,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      //value = null → value?.isEmpty = null → null ?? true = true → if triggers
                      //value = "" → value?.isEmpty = true → true ?? true = true → if triggers
                      //value = "abc" → value?.isEmpty = false → false ?? true = false → if skips
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      if (EmailValidator.validate(value!) == false) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordTEController,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your password';
                      }
                      if (value!.length > 7) {
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  //elevated button na egula, filled button
                  Consumer<SignInProvider>(
                    builder: (context, signInProvider, child) {
                      return Visibility(
                        visible: signInProvider.signInProgress == false,
                        replacement: Center(child: CircularProgressIndicator()),
                        child: FilledButton(
                          onPressed: _onTapSignInButton,
                          child: Icon(Icons.arrow_circle_right_outlined),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: _onTapForgotPasswordButton,
                          child: Text('Forgot Password?'),
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
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    // Navigator.pushReplacementNamed(context, MainBottomNavHolderScreen.name);
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  void _onTapForgotPasswordButton() {
    Navigator.pushNamed(context, ForgotPasswordEmailScreen.name);
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  Future<void> _signIn() async {
    final bool isSuccess = await context.read<SignInProvider>().signIn(
      emailTEController.text.trim(),
      passwordTEController.text.trim(),
    );

    if (isSuccess) {
      Navigator.pushReplacementNamed(context, MainBottomNavHolderScreen.name);
    } else {
      showSnackbarMessage(
        context,
        context.read<SignInProvider>().errorMessage!,
      );
    }
  }
}


//infinity - choltei thakbe
//maxfinite - jototuku jete parbe tototuku jabe
//app e plugin add korle project rerun dite hobe.