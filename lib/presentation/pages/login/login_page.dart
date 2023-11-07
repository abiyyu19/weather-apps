import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/presentation/widgets/header.dart';
import 'package:weather_apps/presentation/widgets/custom_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App Bar for the same layout with Register Page
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            children: [
              // Header
              const Header(),

              const SizedBox(
                height: 10,
              ),

              // Email / Phone Form
              emailPhoneForm(),

              const SizedBox(
                height: 10,
              ),

              // Password Form
              passwordForm(),

              const SizedBox(
                height: 15,
              ),

              // Login Button
              loginButton(context),

              // NOT USED
              // const CustomButton(text: 'LOGIN')

              const SizedBox(
                height: 10,
              ),

              // Divider
              divider(),

              const SizedBox(
                height: 5,
              ),

              // Google SignIn
              googleSignIn(),

              // Don't have an Account?
              registerButton(context),
            ],
          ),
        ),
      ),
    );
  }

  CustomTextFormField emailPhoneForm() {
    return CustomTextFormField(
      controller: _emailPhoneController,
      labelText: 'Email / Phone Number',
      inputType: TextInputType.text,
      prefixIcon: const Icon(
        CupertinoIcons.person_fill,
      ),
    );
  }

  CustomTextFormField passwordForm() {
    return CustomTextFormField(
      controller: _passwordController,
      labelText: 'Password',
      inputType: TextInputType.visiblePassword,
      obsecureText: _obscureText,
      prefixIcon: const Icon(
        CupertinoIcons.lock_fill,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(
            () {
              _obscureText = !_obscureText;
            },
          );
        },
      ),
    );
  }

  Row divider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[700],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Or Continue With",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  GestureDetector googleSignIn() {
    return GestureDetector(
      onTap: () {
        log('Test');
      },
      child: SvgPicture.asset(
        'assets/svg/android_light_sq_SI.svg',
        height: 50,
      ),
    );
  }

  Row registerButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an Account?',
        ),
        TextButton(
          onPressed: () => {
            context.goNamed('register'),
          },
          child: const Text(
            'Register!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  ElevatedButton loginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        context.goNamed('home_page');
      },
      child: const Text(
        'LOGIN',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
