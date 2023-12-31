import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final TextInputType? inputType;
  final bool? obsecureText;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final Widget? prefix;

  const CustomTextFormField({
    super.key,
    this.labelText,
    required this.controller,
    this.inputType,
    this.obsecureText,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
      ),
      obscureText: obsecureText ?? false,
      keyboardType: inputType,
      controller: controller,
    );
  }
}
