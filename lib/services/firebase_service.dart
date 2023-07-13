import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import '../models/participante_model.dart';
import '../models/reuniao_model.dart';
import './db_service.dart';

class FirebaseService implements DbService {

  final  _storage = FirebaseStorage.instance;
  List<Reuniao> _reunioes = [];

  @override
  static Stream<List<Reuniao>> getReunioes() {
  final reuniaoCollection = FirebaseFirestore.instance.collection('reunioes').orderBy('descricao');
    return reuniaoCollection.snapshots().map(
      (querySnapshot) => querySnapshot.docs.map(
        (e) => Reuniao.fromSnapshot(e),
      ).toList(),
    );
  }

  @override
  static Future sendData(Participante participante) async {
    final participanteCollection = FirebaseFirestore.instance.collection('participante');
    final pid = participanteCollection.doc().id;
    final docRef = participanteCollection.doc(pid);

    final newParticipante = Participante(
      id: pid,
      refImage: participante.refImage ?? '',
      reunioes: participante.reunioes ?? [],
      nome: participante.nome,
      apelido: participante.apelido ?? '',
      rua: participante.rua ?? '',
      bairro: participante.bairro ?? '',
      cidade: participante.cidade ?? '',
      uf: participante.uf ?? '',
      contato: participante.contato,
      telFixo: participante.telFixo ?? '',
      profissao: participante.profissao ?? '',
      formProf: participante.formProf ?? '',
      localTrabalho: participante.localTrabalho ?? '',
      dataNascimento: participante.dataNascimento ?? '',
    ).toJason();

    try {
      await docRef.set(newParticipante);
    } catch(e) {
      print("some error ocurred $e");
    }
  }

  @override
  sendPhoto(FilePickerResult? image) {}
}