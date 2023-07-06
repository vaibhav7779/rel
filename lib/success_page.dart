import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Success",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          )
        ],
      ),
    );
  }
}
