import 'package:flutter/material.dart';
import '../controllers/form_controllers.dart';
import '../widgets/text_form_field_widget.dart';

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

  final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 36.0, top: 48.0, right: 36.0, bottom: 36.0),
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Cadastro CESBF',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(94, 53, 177, 1),
                      ),
                    ),
                    const SizedBox(height: 48),
                    TextFormFieldWidget(
                      label: 'Nome',
                      controller: Controllers.nameController,
                      validator: true,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Flexible(
                          child: TextFormFieldWidget(
                            controller: Controllers.apelidoController,
                            label: 'Apelido',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: TextFormFieldWidget(
                            controller: Controllers.dataNascimentoController,
                            label: 'Data de Nascimento',
                            date: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Flexible(
                          child: TextFormFieldWidget(
                            controller: Controllers.celularController,
                            label: 'Celular',
                            validator: true,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: TextFormFieldWidget(
                            controller: Controllers.telefoneController,
                            label: 'Telefone',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: 85,
                      height: 40,
                      child: ElevatedButton(
                        child: const Text(
                          'Validar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () => _formKey.currentState!.validate(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}