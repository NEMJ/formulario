import 'package:flutter/material.dart';
import 'package:formulario/models/reuniao_model.dart';
import '../services/firebase_service.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0),
        child: Column(
          children: [
            StreamBuilder<List<Reuniao>>(
              stream: FirebaseService.getReunioes(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final userData = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: userData!.length,
                      itemBuilder: (context, index) {
                        final singleReuniao = userData[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(singleReuniao.descricao),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}