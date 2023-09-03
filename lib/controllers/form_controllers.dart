import 'package:flutter/material.dart';

class Controllers {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController apelidoController = TextEditingController();
  static TextEditingController celularController = TextEditingController();
  static TextEditingController telFixoController = TextEditingController();
  static TextEditingController dataNascimentoController = TextEditingController();
  static TextEditingController ufController = TextEditingController();
  static TextEditingController cidadeController = TextEditingController();
  static TextEditingController ruaController = TextEditingController();
  static TextEditingController bairroController = TextEditingController();
  static TextEditingController profissaoController = TextEditingController();
  static TextEditingController formProfController = TextEditingController();
  static TextEditingController localTrabalhoController = TextEditingController();

  static cleanControllers() {
    nameController.text = '';
    apelidoController.text = '';
    celularController.text = '';
    telFixoController.text = '';
    dataNascimentoController.text = '';
    ufController.text = '';
    cidadeController.text = '';
    ruaController.text = '';
    bairroController.text = '';
    profissaoController.text = '';
    formProfController.text = '';
    localTrabalhoController.text = '';
  }
}