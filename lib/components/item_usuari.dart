import 'package:flutter/material.dart';

class ItemUsuari extends StatelessWidget {

  final String emailUsuari;
  final Function()? onTap;

  const ItemUsuari({super.key, required this.emailUsuari, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 25, 
          vertical: 5
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            children:[
              const Icon(Icons.person),
            const SizedBox(width: 10),
            Text(emailUsuari),
            ] 
          )
      ),
    );
  }
}