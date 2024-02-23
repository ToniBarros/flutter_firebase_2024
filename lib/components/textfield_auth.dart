import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  
final TextEditingController controller;
final bool obscureText;
final String hintText;

TextFieldAuth({super.key, required this.controller, required this.obscureText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding (padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    child: TextField(
      cursorColor: const Color.fromARGB(255, 255, 100, 0),
      style: const TextStyle(
        color: Color.fromARGB(255, 154, 69, 0),
      ),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.orange[800],
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 229, 190),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        fillColor: const Color.fromARGB(255, 255, 205, 130),
        filled: true,
      ),
    ),
    );
  }
}