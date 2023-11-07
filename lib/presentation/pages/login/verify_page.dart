import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'hehe',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
