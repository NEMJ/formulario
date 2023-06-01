import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
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
  sendData() {}

  @override
  sendPhoto(FilePickerResult? image) {}
}