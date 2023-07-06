import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/login_page.dart';
//import 'package:test/onboarding_screen.dart';
//import 'package:test/start_scren.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: AnimatedSplashScreen(
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/images/loading.svg'),
              const Text(
                "Spash screen here..",
                style: TextStyle(fontSize: 40),
              )
            ],
          ),
          duration: 3000,
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition,
          // nextScreen: OnboardingScreen(),
          nextScreen: const LoginWidget(),
        ),
        //home: const LoginWidget(),
      ),
    );
