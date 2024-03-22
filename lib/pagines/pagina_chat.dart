import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_firebase_2024/auth/servei_auth.dart';
import 'package:flutter_firebase_2024/chat/servei_chat.dart';
import 'package:flutter_firebase_2024/components/bombolla_missatge.dart';

class PaginaChat extends StatefulWidget {
  final String emailAmbQuiParlem;
  final String idReceptor;

  const PaginaChat({super.key, required this.emailAmbQuiParlem, required this.idReceptor});

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {

    final TextEditingController controllerMissatge = TextEditingController();
    final ServeiChat _serveiChat = ServeiChat();
    final ServeiAuth _serveiAuth = ServeiAuth();


  void enviarMissatge() {
    if (controllerMissatge.text.isNotEmpty) {
      print("${controllerMissatge.text}");
      _serveiChat.enviarMissatge(widget.idReceptor, controllerMissatge.text);

      controllerMissatge.clear();
    }
  }

  Widget _construirItemMissatge(DocumentSnapshot document) {
    final dades = document.data() as Map<String, dynamic>;

//Saber si el mostrem a l'esquerra o a la dreta
bool esUsuariActual = dades["idAutor"] == _serveiAuth.getUsuariActual()!.uid;

var alineament = esUsuariActual ? Alignment.centerRight : Alignment.centerLeft;
var colorBombolla = esUsuariActual ? Colors.green[200] : Colors.amber[200];

    return Container(
      alignment: alineament,
      child: BombollaMissatge(
        colorBombolla: colorBombolla ?? Colors.black,
        missatge: dades["missatge"],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.emailAmbQuiParlem),
      ),
      body: Column(
        children: [
          //zona missatge
          Expanded(child: _construirLlistaMissatges()),
          //zona escriure missatge
          _construirZonaInputUsuari(),
        ],
      ),
    );
  }

  Widget _construirLlistaMissatges() {
    
    String idUsuariActual = _serveiAuth.getUsuariActual()!.uid;

    return StreamBuilder(
      stream: _serveiChat.getMissatges(widget.idReceptor, idUsuariActual),
      builder: (context, snapshot){
        //Cas que hi hagi error
        if(snapshot.hasError){
          return const Text("Error");
        }

        //Estar encara carregant
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Carregant dades...");
        }

        //Retornar dades (ListView)
        return ListView(
          children: snapshot.data!.docs.map((Document) => _construirItemMissatge(Document)).toList(),
        );
      },
    
    );
    
  }

  Widget _construirZonaInputUsuari() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controllerMissatge,
              decoration: InputDecoration(
                fillColor: Colors.amber[100],
                filled: true,
                hintText: "Escriu el teu missatge",
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: enviarMissatge,
            icon: const Icon(Icons.send),
            color: Colors.amber[100],
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            )
          ),
        ],
      ),
    );
  }
}
