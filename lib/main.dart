import 'package:flutter/material.dart';
import 'package:flutter_firebase_2024/pagines/pagina_login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaLogin(),
      );
 }
}

/*
1)Tenir el node.js instal·lat
2)npm install -g firebase-tools
3)firebase login
cambiar el nombre del archivo ps1
Si tornem a firebase login, ens dirà la compta amb la que estem connectats
si vulguem canviar de compta, fem firebase logout
*/