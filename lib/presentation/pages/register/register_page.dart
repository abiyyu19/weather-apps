import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_apps/presentation/widgets/custom_textformfield.dart';
import 'package:weather_apps/presentation/widgets/header.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

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

              // Register Button
              registerButton(),

              const SizedBox(
                height: 10,
              ),

              // Divider
              divider(),

              const SizedBox(
                height: 5,
              ),

              // Google SignUp
              googleSignUp(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector googleSignUp() {
    return GestureDetector(
      onTap: () {
        log('Test');
      },
      child: SvgPicture.asset(
        'assets/svg/android_light_sq_SU.svg',
        height: 50,
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

  ElevatedButton registerButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {},
      child: const Text(
        'REGISTER',
        style: TextStyle(
          fontSize: 18,
        ),
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

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
