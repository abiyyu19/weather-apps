import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/services/firebase_service.dart';

void handleLoginEmail(BuildContext context, String email, String password) {
  signInEmailPassword(email, password).then((value) {
    if (value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login berhasil"),
        ),
      );
      context.goNamed('home_page');
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email/Password Salah"),
        ),
      );
      Navigator.pop(context);
    }
  });
}

void handleLoginRegisterGoogle(BuildContext context) {
  signInWithGoogle().then((value) {
    if (value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login berhasil"),
        ),
      );
      context.goNamed('home_page');
      // Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email/Password Salah"),
        ),
      );
      // Navigator.pop(context);
    }
  });
}
