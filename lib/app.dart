//code smell (dirty code/bad code)
//1. unnecessary complexity, readability kom, ami chara code keu porte pare na
//2. akta jinish change korte giye bhenge gese
//3. boro method likhle code smell ase
//4. akta file e 2 ta class likhle code smell ase

//clean code - readible code

//app file - application configuration file

//this is the only file where classname and filename won't match.

import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/forgot_password_email_screen.dart';
import 'package:task_management/ui/screens/forgot_password_reset_password_screen.dart';
import 'package:task_management/ui/screens/forgot_password_verify_otp_screen.dart';
import 'package:task_management/ui/screens/main_bottom_nav_holder_screen.dart';
import 'package:task_management/ui/screens/sign_in_screen.dart';
import 'package:task_management/ui/screens/sign_up_screen.dart';
import 'package:task_management/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //colorschemeseed diye green er bibhinno shade generate korbe throughout the app.
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        scaffoldBackgroundColor: Colors.green.shade50
      ),

      // home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        SplashScreen.name: (_) => SplashScreen(), //_ is to ignore ctx/context
        SignInScreen.name: (_) => SignInScreen(),
        SignUpScreen.name: (_) => SignUpScreen(),
        ForgotPasswordEmailScreen.name: (_) => ForgotPasswordEmailScreen(),
        ForgotPasswordVerifyOtpScreen.name: (_) => ForgotPasswordVerifyOtpScreen(),
        ForgotPasswordResetPasswordScreen.name: (_) => ForgotPasswordResetPasswordScreen(),
        MainBottomNavHolderScreen.name: (_) => MainBottomNavHolderScreen(),
      },
      initialRoute: SplashScreen.name,
    );
  }
}
