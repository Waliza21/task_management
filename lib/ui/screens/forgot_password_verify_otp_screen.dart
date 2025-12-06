import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management/ui/screens/forgot_password_reset_password_screen.dart';
import 'package:task_management/ui/screens/sign_in_screen.dart';
import 'package:task_management/ui/screens/sign_up_screen.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class ForgotPasswordVerifyOtpScreen extends StatefulWidget {
  const ForgotPasswordVerifyOtpScreen({super.key});

  static const String name = '/forgot-password-verify-otp';

  @override
  State<ForgotPasswordVerifyOtpScreen> createState() =>
      _ForgotPasswordVerifyOtpScreenState();
}

class _ForgotPasswordVerifyOtpScreenState
    extends State<ForgotPasswordVerifyOtpScreen> {
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
                "OTP Verification",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "A 6 digits verification OTP has been sent to your email address",
                // style: Theme.of(context).textTheme.bodyMedium, //default ei body medium deya thake
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              //pin er boxgular jonno pin_code_fields ei package add kore nilam and eta use korbo.
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: Colors.white,
                  selectedFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                appContext: context,
              ),
              const SizedBox(height: 8),
              //elevated button na egula, filled button
              FilledButton(
                onPressed: _onTapVerifyButton,
                child: Text('Verify'),
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
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInScreen.name,
      (predicate) => false,
    );
  }

  void _onTapVerifyButton() {
    Navigator.pushNamed(context, ForgotPasswordResetPasswordScreen.name);
  }
}


//infinity - choltei thakbe
//maxfinite - jototuku jete parbe tototuku jabe