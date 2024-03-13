import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //fer login
  Future<UserCredential> loginEmailiPassword(String email, password) async {
    print("hola");
try {
      UserCredential credencialUsuari = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credencialUsuari;
  } on FirebaseAuthException catch (e) {
    throw Exception(e.code);
  }
  }

  //fer registre

  Future<UserCredential> RegistreEmailiPassword(String email, password) async {
    try {
      UserCredential credencialUsuari = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _firestore.collection("usuaris").doc(credencialUsuari.user!.uid).set({
        "email": email,
        "uid": credencialUsuari.user!.uid,
      });

      return credencialUsuari;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  
  //fer logout
  Future<void> logout() async {
    await _auth.signOut();
  }


}