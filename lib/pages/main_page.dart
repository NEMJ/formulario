import 'package:flutter/material.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:formulario/widgets/checkbox_widget.dart';
import 'package:intl/intl.dart';
import '../controllers/form_controllers.dart';
import '../models/checkbox_model.dart';
import '../models/participante_model.dart';
import '../widgets/dropdown_form_field_widget.dart';
import '../widgets/text_form_field_widget.dart';
import '../services/firebase_service.dart';
import '../models/reuniao_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String imageName = 'Nenhuma imagem selecionada';
  FilePickerResult? _imagePicker;

  onPressedImagePicker() async {
    _imagePicker = await FilePickerWeb.platform.pickFiles(
      type: FileType.image,
    );
    
    if(_imagePicker != null) {
      imageName = _imagePicker!.files.single.name;
      setState(() => imageName);
    }
  }

  final _formKey = GlobalKey<FormState>();

  final List<String> ufs = [ '',
    'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO',
    'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
    'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO',
  ];

  String ufSelecionado = '';

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width > 780
      ? 700 : MediaQuery.of(context).size.width * 0.9;

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
      backgroundColor: Colors.deepPurple.shade200,
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
                            controller: Controllers.telFixoController,
                            label: 'Telefone',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Flexible(
                          child: DropdownFormFieldWidget(
                            listItems: ufs,
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
                      controller: Controllers.formProfController,
                      label: 'Formação Profissional',
                    ),
                    const SizedBox(height: 32),
                    TextFormFieldWidget(
                      controller: Controllers.localTrabalhoController,
                      label: 'Local de Trabalho',
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 40,
                      child: TextButton(
                        onPressed: onPressedImagePicker,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade50,
                        ),
                        child: const Text(
                          'Selecione uma imagem',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      imageName,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 52, 20, 106),
                      ),
                    ),
                    const SizedBox(height: 48),
                    StreamBuilder<List<Reuniao>>(
                      stream: FirebaseService.getReunioes(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else {

                          final List<String>? entidades = []; // Lista de entidades para separar as reuniões.
                          final reuniaoData = snapshot.data; // Lista de reuniões.

                          // Verificação para não alimentar a lista com entidades diferentes.
                          if(reuniaoData != null) {
                            reuniaoData.forEach((reuniao) {
                              if(entidades != null && entidades.contains(reuniao.entidade)) return;
                              entidades!.add(reuniao.entidade);
                            });
                          }

                          return Flexible(
                            fit: FlexFit.loose,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: entidades!.length,
                              itemBuilder: (context, index) {
                                return ExpansionTile(
                                  title: Text(entidades[index]),
                                  children: [
                                    for(var i = 0; i < reuniaoData!.length; i++)
                                      if(reuniaoData[i].entidade == entidades[index])
                                        CheckBoxWidget(
                                          item: CheckBoxModel(
                                            id: reuniaoData[i].id,
                                            title: reuniaoData[i].descricao,
                                            subtitle: "${reuniaoData[i].diaSemana} - ${reuniaoData[i].horarioInicio} - ${reuniaoData[i].horarioTermino}",
                                            checked: false,
                                          ),
                                        ),
                                  ],
                                );
                              }
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 110,
                          height: 40,
                          child: ElevatedButton(
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              bool validado = _formKey.currentState!.validate();
                              if(validado) {
                                FirebaseService.sendData(Participante(
                                  refImage: '',
                                  reunioes: [],
                                  nome: Controllers.nameController.text,
                                  apelido: Controllers.apelidoController.text,
                                  rua: Controllers.ruaController.text,
                                  bairro: Controllers.bairroController.text,
                                  cidade: Controllers.cidadeController.text,
                                  uf: Controllers.ufController.text,
                                  celular: Controllers.celularController.text,
                                  telFixo: Controllers.telFixoController.text,
                                  profissao: Controllers.profissaoController.text,
                                  formProf: Controllers.formProfController.text,
                                  localTrabalho: Controllers.localTrabalhoController.text,
                                  dataNascimento: Controllers.dataNascimentoController.text
                                ));  // Ajustar envio com foto
                              } else {
                                print('Preencha os campos obrigatórios');
                              }
                            },
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