import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kart_zip/global/colors.dart';
import 'package:kart_zip/screens/onboarding_screen/onboarding.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: BgGreen,
        child: Center(
          child: FlutterSplashScreen.fadeIn(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 47, 187, 52),
                Color.fromARGB(255, 47, 187, 52)
              ],
            ),
            childWidget: SizedBox(
              child: Image.asset("assets/logo.png"),
            ),
            defaultNextScreen: const onboarding(),
          ),
        ),
      )),
    );
  }
}
