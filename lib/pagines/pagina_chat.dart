import 'package:flutter/material.dart';

class PaginaChat extends StatefulWidget {
  final String emailAmbQuiParlem;

  const PaginaChat({super.key, required this.emailAmbQuiParlem});

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {

    final TextEditingController controllerMissatge = TextEditingController();


  void enviarMissatge() {
    if (controllerMissatge.text.isNotEmpty) {
      print("enviant missatge: ${controllerMissatge.text}");
      controllerMissatge.clear();
    }
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
    return Container();
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
