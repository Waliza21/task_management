import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/ui/screens/sign_in_screen.dart';
import 'package:task_management/ui/utils/asset_paths.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//svg picture bhenge jay na
//flutter built in svg picture support kore na,external package ene pubspec e rakhlam and then ekhane SvgPicture widget use korlam, its similar as Image widget.
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navToNextScreen();
  }

  Future<void> _navToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(child: SvgPicture.asset(AssetPaths.logoSvg, width: 120)),
      ),
    );
  }
}

//assets/images/background.svg - this is called magicString, this is also a code smell, for this - utils folder khule shekhane asset paths file khule shkehane variable akare class er moddhe rekhe dilam, ete ei image change korte hole, okhane path ta change kore dilei joto jaygay eta use hobe toto jaygay auto change hobe.
