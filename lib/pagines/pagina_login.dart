import 'package:flutter/material.dart';
import 'package:flutter_firebase_2024/components/boto_auth.dart';
import 'package:flutter_firebase_2024/components/textfield_auth.dart';

class PaginaLogin extends StatefulWidget {
    PaginaLogin({super.key});

  final controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  State<PaginaLogin> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PaginaLogin> {

    void ferLogin() {
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 183, 159),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logo
                    const Icon(
                      Icons.fireplace,
                      size: 120,
                      color: Color.fromARGB(255, 255, 240, 218),
                    ),
                    //frase
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Benvingut a la nostra app',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 240, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //text divisori
                    const SizedBox(
                      height: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(255, 255, 240, 218),
                              thickness: 5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Fes login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 240, 218),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(255, 255, 240, 218),
                              thickness: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //textfield email
                    TextFieldAuth(
                        controller: widget.controllerEmail,
                        obscureText: false,
                        hintText: "Email"),
                    //textfield password
                    TextFieldAuth(
                        controller: widget.controllerPassword,
                        obscureText: true,
                        hintText: "Password"),
                    //no está registrat
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("No ets membre?"),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/registre');
                            },
                            child: const Text("Registra't", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),),
                          ),
                          
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,),
                    //boto login
                    BotoAuth(text: "login", 
                    onTap: ferLogin,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        );
  }
}
