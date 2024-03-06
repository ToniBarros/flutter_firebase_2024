import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {

  final FirebaseAuth _auth = FirebaseAuth.instance;

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