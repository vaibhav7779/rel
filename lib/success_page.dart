import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test/pdf.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 90,
          percent: 1,
          animation: true,
          lineWidth: 40,
          progressColor: Color(0xFFf8a532),
          backgroundColor: Color(0xFF08194e),
          circularStrokeCap: CircularStrokeCap.butt,
          animationDuration: 3000,
          onAnimationEnd: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Pdf(),
              ),
            );
          },
        ),
      ],
    );
  }
}
