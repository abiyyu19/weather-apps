import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

// Handle Login Using Email and Password
Future<bool> signInEmailPassword(
  String email,
  String password,
) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'wrong-password') {
      log('The password you Entered is wrong');
    } else if (e.code == 'email-already-in-use') {
      log('An account already exists for that email.');
    } else if (e.code == 'user-not-found') {
      log('No account found for that email');
    }
    return false;
  }
}

// Handle Register Using Email and Password
Future<bool> signUpEmailPassword(
  String email,
  String password,
) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'wrong-password') {
      log('The password you Entered is wrong');
    } else if (e.code == 'email-already-in-use') {
      log('An account already exists for that email.');
    } else if (e.code == 'user-not-found') {
      log('No account found for that email');
    }
    return false;
  }
}

// Handle Login/Register Using Google Account
Future<bool> signInWithGoogle() async {
  try {
    log('Test');
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    await FirebaseAuth.instance.signInWithProvider(googleAuthProvider);

    return true;
  } catch (e) {
    log('ini errornya $e');
    return false;
  }
}

// Handle Login Using Phone Number
Future<bool> signInPhoneNumber(String phoneNumber) async {
  try {
    log('Test');
    // GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    await FirebaseAuth.instance.signInWithPhoneNumber(phoneNumber);

    return true;
  } catch (e) {
    log('ini errornya $e');
    return false;
  }
}

// class GoogleAuthService {
//   signInWithGoogle() async {
//     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

//     final GoogleSignInAuthentication gAuth = gUser!.authentication;
//   }
// }

// Handle Logout
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  return;
}
