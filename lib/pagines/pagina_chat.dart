import 'package:flutter/material.dart';

class PaginaChat extends StatelessWidget {
  const PaginaChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amb qui parlem'),
      ),
      body: Column(
        children: [
          //zona missatge
          Expanded(
            child: _construirLlistaMissatges()
            ),
          //zona escriure missatge
          _construirZonaInputUsuari(),
        ],
      ),
    );
  }
  Widget _construirLlistaMissatges (){
  return Container();
  }

  Widget _construirZonaInputUsuari (){
    return Container();
  }
}