import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),

        // Weather Icon
        Center(
          child: Image.asset(
            'assets/images/cloudy.png',
            height: 100,
            width: 100,
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        // Text
        // Text(
        //   "Welcome!",
        //   textAlign: TextAlign.start,
        //   style: TextStyle(
        //     fontSize: 16,
        //     color: Colors.grey[700],
        //   ),
        // ),

        Text(
          "All Weather Information in One App!",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
