import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;
  final double width;
  final double height;

  const TextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        constraints: BoxConstraints(
            minWidth: 5,
            maxWidth: width,
            minHeight: 5,
            maxHeight: height
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.grey,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),

    );
  }
}
