import 'package:flutter/material.dart';

class BotoAuth extends StatelessWidget {
    final Function()? onTap;
    final text;
  const BotoAuth({super.key, required this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 154, 69, 0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 25 ),
        child: Text("Login", style: 
        TextStyle(
          fontSize: 31,
          color: Colors.orange[100],
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}