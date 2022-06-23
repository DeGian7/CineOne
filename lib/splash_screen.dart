import 'package:cine_one/Login/login.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

  static navigate(
      {required String name,
      required Function(dynamic context) next,
      required Future Function() until,
      required String startAnimation}) {}
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 12500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Spacer(),
            RiveAnimation.asset("assets/login/star_wars.riv",
                alignment: Alignment.center, fit: BoxFit.cover),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
 // Image.network(
      //  'https://res.cloudinary.com/tecnologi-zifrikc/image/upload/v1653491793/4fe7d2_a78f5582c647409981023ddbebb11775_c4vvzm.gif');