import 'package:flutter/material.dart';
import '../controllers/form_controllers.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

  double width = MediaQuery.of(context).size.width > 780
    ? 700 : MediaQuery.of(context).size.width * 0.9;


    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(36.0),
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    'Cadastro CESBF',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: Controllers.nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: Controllers.lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Sobrenome',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: Controllers.celularController,
                          decoration: const InputDecoration(
                            labelText: 'Celular',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Telefone',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    child: const Text('Validar'),
                    onPressed: () {
                      print(Controllers.nameController.text);
                      print(Controllers.lastNameController.text);
                      print(Controllers.celularController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}