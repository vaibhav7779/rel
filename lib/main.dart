import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/2.dart';

// import 'package:test/onboarding_screen.dart';
import 'package:test/palette.dart';
// import 'package:test/phone.dart';
import 'package:test/start_scren.dart';
// import 'package:test/login_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: buildMaterialColor(Color(0xFF08194e)),
        ),
        // home: AnimatedSplashScreen(
        //   splash: 'assets/images/lottie.gif',
        //   duration: 3800,
        //   backgroundColor: Color(0xFF08194e),
        //   splashIconSize: 300,
        //   splashTransition: SplashTransition.fadeTransition,
        //   nextScreen: OnboardingScreen(),
        //   // nextScreen: MyPhone(),
        // ),
        home: StartScreen(),
      ),
    );
