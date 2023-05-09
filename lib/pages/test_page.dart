import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  final _formKey = GlobalKey<FormState>();
  String hintText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(180, 211, 47, 47),
                    ),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14),
                    errorStyle: const TextStyle(fontSize: 0, height: -8),
                  ),
                  validator: (value) {
                    if(value == null || value == '') {
                      setState(() => hintText = 'campo obrigatório');
                      return '';
                    } else {
                      setState(() => hintText = '');
                    }
                  },
                ),
                const SizedBox(height: 24,),
                SizedBox(
                  width: 80,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    child: const Text('Validar')
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}