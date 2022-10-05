import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_lista_presentes/autenticacao/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_presentes/criarPresentes/newPresentPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MeusPresentes());
}

class MeusPresentes extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController _textPresentsController = TextEditingController();

  List<String> listNames = [];

  @override
  void initState() {
    refresh();

    db.collection("listPresents").snapshots().listen((snapshot) {
      setState(() {
        listNames = [];
        snapshot.docs.forEach((document) {
          listNames.add(document.get("name"));
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de presentes 🎁"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => refresh(),
        child: Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Vamos pedir um presentes?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _textPresentsController,
              decoration: InputDecoration(labelText: "Nome do Presente"),
            ),
            ElevatedButton(
              onPressed: () => sendData(),
              child: Text("Cadastar"),
            ),
            SizedBox(
              height: 16,
            ),
            (listNames.length == 0)
                ? Text(
                    "Nenhum presente no momento",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  )
                : Column(
                    children: [
                      for (String s in listNames) Text(s),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  void refresh() async {
    QuerySnapshot query = await db.collection("listPresents").get();

    listNames = [];
    query.docs.forEach((document) {
      print(document.id); //Mostrar o id que escolhemos
      String data = document.get("name");
      setState(() {
        listNames.add(data);
      });
    });
  }

//impremir lista
  void sendData() {
    String id = Uuid().v1(); //criando id aleatorio
    db
        .collection("listPresents")
        .doc(id)
        .set({"name": _textPresentsController.text});

    //Visual Feedback
    _textPresentsController.text = "";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Salvo no Firestore!"),
      ),
    );
  }
}
