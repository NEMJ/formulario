import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

    onPressedDatePicker() async {
      DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime(2120),
        // locale: Locale('pt', 'BR'),
      );

      if(datePicker != null) {
        setState(() {
          Controllers.dataNascimentoController.text = DateFormat('dd/MM/yyyy').format(datePicker);
        });
      }
    }

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
                            icon: Icons.calendar_month_rounded,
                            onPressedIconAsync: onPressedDatePicker,
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
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormFieldWidget(
                            controller: Controllers.ufController,
                            label: 'UF',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          flex: 3,
                          child: TextFormFieldWidget(
                            controller: Controllers.cidadeController,
                            label: 'Cidade',
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 32),
                    TextFormFieldWidget(
                      controller: Controllers.ruaController,
                      label: 'Rua',
                    ),
                    const SizedBox(height: 32),
                    TextFormFieldWidget(
                      controller: Controllers.bairroController,
                      label: 'Bairro',
                    ),
                    const SizedBox(height: 32),
                    TextFormFieldWidget(
                      controller: Controllers.profissaoController,
                      label: 'Profissão',
                    ),
                    const SizedBox(height: 32),
                    TextFormFieldWidget(
                      controller: Controllers.formacaoController,
                      label: 'Formação Profissional',
                    ),
                    const SizedBox(height: 32),
                    TextFormFieldWidget(
                      controller: Controllers.localTrabalhoController,
                      label: 'Local de Trabalho',
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 110,
                          height: 40,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade200,
                            ),
                            child: const Text(
                              'Reuniões',
                              style: TextStyle(
                                color: Color.fromRGBO(69, 39, 160, 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          height: 40,
                          child: ElevatedButton(
                            child: const Text(
                              'Cadastrar',
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