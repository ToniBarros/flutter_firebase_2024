import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BombollaMissatge extends StatelessWidget {

final Color colorBombolla;
final String missatge;

  const BombollaMissatge({super.key, required this.colorBombolla, required this.missatge});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorBombolla,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Text(missatge),
    );
  }
}