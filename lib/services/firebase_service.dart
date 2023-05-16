import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import '../models/reuniao_model.dart';
import './db_service.dart';

class FirebaseService extends DbService {

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  List<Reuniao> reunioes = [];

  @override
  Future<List<Reuniao>> getReunioes() async {
    await db.collection('reunioes').orderBy('entidade').snapshots().listen((query) {
      if(query.docs.isNotEmpty) {
        query.docs.forEach((doc) {
          reunioes.add(
            Reuniao(
              id: doc.get('id'),
              descricao: doc.get('descricao'),
              entidade: doc.get('entidade'),
              diaSemana: doc.get('diaSemana'),
              horarioInicio: doc.get('horarioInicio'),
              horarioTermino: doc.get('horarioTermino'),
            ),
          );
        });
      }
    });

    return reunioes;
  }

  @override
  sendData() {}

  @override
  sendPhoto(FilePickerResult? image) {}
}