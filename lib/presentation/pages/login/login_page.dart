import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/presentation/pages/login/handle_login.dart';
import 'package:weather_apps/presentation/widgets/header.dart';
import 'package:weather_apps/presentation/widgets/custom_textformfield.dart';
import 'package:weather_apps/services/firebase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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

                const TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Phone',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: TabBarView(
                    children: [
                      emailSection(),
                      phoneSection(),
                    ],
                  ),
                ),

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
      ),
    );
  }

  Column phoneSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Phone Form
        phoneNumberForm(),

        const SizedBox(
          height: 5,
        ),

        const Text('example: +62 857 1636 6797'),

        const SizedBox(
          height: 10,
        ),

        // Login Button
        loginButton(false),
      ],
    );
  }

  CustomTextFormField phoneNumberForm() {
    return CustomTextFormField(
      controller: _phoneNumberController,
      labelText: 'Phone Number',
      inputType: TextInputType.number,
      prefix: const Text(
        '+62  ',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Column emailSection() {
    return Column(
      children: [
        // Email Form
        emailForm(),

        const SizedBox(
          height: 10,
        ),

        // Password Form
        passwordForm(),

        const SizedBox(
          height: 15,
        ),

        // Login Button
        loginButton(true),
      ],
    );
  }

  CustomTextFormField emailForm() {
    return CustomTextFormField(
      controller: _emailController,
      labelText: 'Email Address',
      inputType: TextInputType.emailAddress,
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
        handleLoginRegisterGoogle(context);
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

  ElevatedButton loginButton(bool isEmail) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        if (isEmail) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
          handleLoginEmail(
            context,
            _emailController.text,
            _passwordController.text,
          );
        } else {
          var number = '+62${_phoneNumberController.text.trim()}';
          log(number);
          signInPhoneNumber(number);
          context.goNamed('verify');
        }
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
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
