import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/photo_picker.dart';
import 'package:task_management/ui/widgets/screen_background.dart';
import 'package:task_management/ui/widgets/tm_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String name = '/update-profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(fromUpdateProfile: true),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              SizedBox(height: 25),
              Text(
                "Update Profile",
                style: Theme.of(context).textTheme.titleLarge,

                ///theme e jeta define kore ashchi sheta overwrite korte chaile
                // style: Theme.of(context).textTheme.titleLarge?.copyWith(
                //   fontWeight: FontWeight.w900,
                // ),
              ),
              SizedBox(height: 8),
              GestureDetector(onTap: () {}, child: PhotoPicker()),
              // TextButton(
              //   style: ButtonStyle(
              //     backgroundColor: WidgetStatePropertyAll<Color>(Colors.grey),
              //   ),
              //   onPressed: () {},
              //   child: Text('Photo', style: TextStyle(color: Colors.black)),
              // ),
              TextFormField(decoration: InputDecoration(hintText: "Email")),
              TextFormField(
                decoration: InputDecoration(hintText: "First Name"),
              ),
              TextFormField(decoration: InputDecoration(hintText: "Last Name")),
              TextFormField(decoration: InputDecoration(hintText: "Mobile")),
              TextFormField(decoration: InputDecoration(hintText: "Password")),
              SizedBox(height: 8),
              FilledButton(
                onPressed: _onTapUpdateButton,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapUpdateButton() {}
}
