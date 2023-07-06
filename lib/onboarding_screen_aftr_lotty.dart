import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:test/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:introduction_screen/introduction_screen.dart'

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'A reader lives a thousand lives',
            body: 'The man who never reads lives only one.',
            image: buildImage('assets/ebook.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Featured Books',
            body: 'Available right at your fingerprints',
            image: buildImage('assets/page1.svg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Simple UI',
            body: 'For enhanced reading experience',
            image: buildImage('assets/page2.svg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Today a reader, tomorrow a leader',
            body: 'Start your journey',
            footer: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              child: const Text('asd'),
            ),
            image: buildImage('assets/page3.svg'),
            decoration: getPageDecoration(),
          ),
        ],
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeSize: Size.square(20),
          activeColor: Colors.red,
        ),
        showDoneButton: true,
        done: const Text("done", style: TextStyle(fontSize: 20)),
        showSkipButton: true,
        skip: const Text('Skip', style: TextStyle(fontSize: 20)),
        showNextButton: true,
        next: const Icon(Icons.arrow_forward, size: 20),
        onDone: () => goToLogin(context),
      ),
    );
  }
}

void goToLogin(context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginWidget(),
    ),
  );
}

DotsDecorator getDotDecoration() => DotsDecorator(
      color: Color(0xFFBDBDBD),
      //activeColor: Colors.orange,
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

PageDecoration getPageDecoration() => const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
      imagePadding: EdgeInsets.all(24),
      pageColor: Colors.white,
    );

Widget buildImage(String path) =>
    Center(child: SvgPicture.asset(path, width: 350));
