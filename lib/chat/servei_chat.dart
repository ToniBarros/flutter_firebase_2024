import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_2024/models/missatge.dart';

class ServeiChat {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream<List<Map<String, dynamic>>> getUsuaris() {

    return _firestore.collection("Usuaris").snapshots().map((event) {

      return event.docs.map((document) {

        final usuari = document.data();
        return usuari;
      }).toList();
    });
  }

  Future enviarMissatge(String idReceptor, String StringMissatge) async{
    final String idActual = _auth.currentUser!.uid;
    final String emailUsuariActual = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Missatge nouMissatge = Missatge(
      idAutor: idActual,
      emailAutor: emailUsuariActual,
      idReceptor: idReceptor,
      missatge: StringMissatge,
      timestamp: timestamp,
    );
    //Construir la sala de xat d'aquesta missatge
    List<String> idsUsuaris = [idActual, idReceptor];
    idsUsuaris.sort();
    String idSalaXat = idsUsuaris.join("_");

    //Guardar el missatge a la sala de xat
    await _firestore.collection("SalesXat").doc(idSalaXat).collection("Missatges").add(nouMissatge.toMap());
    }

  Stream<QuerySnapshot> getMissatges(String idReceptor, idUsuariActual) {
//volem trobar la salachat formada per l'id dels dos usuaris
// (idusuari i idreceptor)

//Creem l'id de la sala de xat com quan hi guardem missatges
    List<String> idsUsuaris = [idUsuariActual, idReceptor];
    idsUsuaris.sort();
    String idSalaXat = idsUsuaris.join("_");

    return _firestore.collection("SalesXat").doc(idSalaXat).collection("Missatges").orderBy("timestamp", descending: false).snapshots();

  }
  }
