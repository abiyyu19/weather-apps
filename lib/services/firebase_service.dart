import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
String? verificationID;

// Handle Login Using Email and Password
Future<bool> signInEmailPassword(
  String email,
  String password,
) async {
  try {
    await _auth.signInWithEmailAndPassword(
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
    await _auth.createUserWithEmailAndPassword(
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

    await _auth.signInWithProvider(googleAuthProvider);

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

    // await _auth.signInWithPhoneNumber(phoneNumber);
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        log('huhehu $phoneAuthCredential');
        // context.goNamed('verify');
        // await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == 'invalid-phone-number') {
          log('${error.message}');
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationID = verificationId;
      },
    );

    return true;
  } on FirebaseAuthException catch (e) {
    log('ini errornya $e');
    return false;
  }
}

Future<bool> verifyOTP(String otp) async {
  try {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        smsCode: otp,
        verificationId: verificationID!,
      ),
    );

    return credentials.user != null ? true : false;
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
  await _auth.signOut();
  return;
}
