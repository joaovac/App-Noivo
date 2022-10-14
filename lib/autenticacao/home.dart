import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_lista_presentes/autenticacao/signin.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_presentes/criarPresentes/newPresentPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Lista de presentes 🎁",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.red.shade400,
            Colors.purple,
            Colors.blue.shade800,
          ],begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            ),
          ),
        ),
        /*body: Center(
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
        ),*/
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,
              size: 30.0, color: Color.fromARGB(255, 227, 233, 236)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MeusPresentes()));
          },
          backgroundColor: Color.fromARGB(255, 71, 32, 197),
        ));
  }
}
