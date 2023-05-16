import 'package:flutter/material.dart';
import 'package:formulario/models/reuniao_model.dart';
import '../services/firebase_service.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  List<Reuniao> reunioes = [];
  List<String> r = ["flores", "doces", "cadeira", "mesa"];
  
  @override
  void initState() {
    getReunioes();
    super.initState();
  }

  Future getReunioes() async {
    reunioes = await FirebaseService().getReunioes();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 36.0, top: 48.0, right: 36.0, bottom: 36.0),
              // width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text('Teste'),
                    onPressed: () {
                      reunioes.forEach((element) {
                        print(element.descricao);
                      });
                    },
                  ),
                  Text(reunioes.length.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}