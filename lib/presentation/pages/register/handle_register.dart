import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/services/firebase_service.dart';

void handleRegisterEmail(BuildContext context, String email, String password) {
  signUpEmailPassword(email, password).then((value) {
    if (value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Akun Berhasil Dibuat!"),
        ),
      );
      context.goNamed('login');
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Akun Gagal Dibuat"),
        ),
      );
      Navigator.pop(context);
    }
  });
}
