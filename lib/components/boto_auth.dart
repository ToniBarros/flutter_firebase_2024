import 'package:flutter/material.dart';

class BotoAuth extends StatelessWidget {
  const BotoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}