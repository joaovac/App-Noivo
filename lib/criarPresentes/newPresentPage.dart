import 'package:app_lista_presentes/criarPresentes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewPresentScreen extends StatefulWidget {
  const NewPresentScreen({Key? key}) : super(key: key);

  @override
  _NewPresentScreenState createState() => _NewPresentScreenState();
}

class _NewPresentScreenState extends State<NewPresentScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController _nomePresenteController = TextEditingController();
    TextEditingController _lojaPresenteController = TextEditingController();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Criar Presente",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.pink.shade400,
              Colors.purple,
              Colors.blue.shade800,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Nome", _nomePresenteController),
                      const SizedBox(height: 20),
                      reusableTextField("Loja", _lojaPresenteController)
                    ])))));
    //Firebase
  }
}
