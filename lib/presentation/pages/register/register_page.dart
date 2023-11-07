import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/presentation/pages/login/handle_login.dart';
import 'package:weather_apps/presentation/pages/register/handle_register.dart';
import 'package:weather_apps/presentation/widgets/custom_textformfield.dart';
import 'package:weather_apps/presentation/widgets/header.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: TabBarView(
                    children: [
                      emailSection(),
                      phoneSection(),
                    ],
                  ),
                ),

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
      ),
    );
  }

  Column phoneSection() {
    return Column(
      children: [
        // Phone Form
        phoneNumberForm(),

        const SizedBox(
          height: 15,
        ),

        // Login Button
        registerButton(false),
      ],
    );
  }

  CustomTextFormField phoneNumberForm() {
    return CustomTextFormField(
      controller: _phoneNumberController,
      labelText: 'Phone Number',
      inputType: TextInputType.number,
      prefixIcon: const Icon(
        CupertinoIcons.phone,
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
        registerButton(true),
      ],
    );
  }

  GestureDetector googleSignUp() {
    return GestureDetector(
      onTap: () {
        log('Test');
        handleLoginRegisterGoogle(context);
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

  ElevatedButton registerButton(bool isEmail) {
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
          handleRegisterEmail(
            context,
            _emailController.text,
            _passwordController.text,
          );
        } else {
          context.goNamed('verify');
        }
      },
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

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
