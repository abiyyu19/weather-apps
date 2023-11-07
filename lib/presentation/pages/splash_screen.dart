import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    log('id user ${user?.uid}');
    log('emailnya ${user?.email}');
    _navigateHomeScreen();
  }

  _navigateHomeScreen() async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
      () => context.goNamed(user?.uid != null ? 'home_page' : 'login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/cloudy.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
