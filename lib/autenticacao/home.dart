import 'package:app_lista_presentes/criarPresentes/newPresentPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_lista_presentes/autenticacao/signin.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Sair"),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Você saiu da sua conta");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,
              size: 30.0, color: Color.fromARGB(255, 227, 233, 236)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewPresentScreen()));
          },
          backgroundColor: Color.fromARGB(255, 71, 32, 197),
        ));
  }
}
