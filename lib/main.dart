import 'package:flutter/material.dart';
import 'package:flutter_firebase_2024/firebase_options.dart';
import 'package:flutter_firebase_2024/pagines/pagina_login.dart';
  import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_2024/pagines/pagina_registre.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaRegistre(),
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
Fer dart pub global activate flutterfire_cli
Vincular projecte local al projecte de firebase de la consola: flutterfire configure
  -flutter pub add firebase_auth
  -flutter pub add firestore_core
*/
 