import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:firebase_storage/firebase_storage.dart' as storage;
import '../models/participante_model.dart';
import '../models/reuniao_model.dart';

class FirebaseService {

  static Stream<List<Reuniao>> getReunioes() {
    final reuniaoCollection = firestore.FirebaseFirestore
      .instance.collection('reunioes').orderBy('descricao');

    return reuniaoCollection.snapshots().map(
      (querySnapshot) => querySnapshot.docs.map(
        (e) => Reuniao.fromSnapshot(e),
      ).toList(),
    );
  }

  static Future sendData(Participante participante, Uint8List? image) async {

    final participanteCollection = firestore.FirebaseFirestore
      .instance.collection('participantes');

    final pid = participanteCollection.doc().id;
    final docRef = participanteCollection.doc(pid);
    String? urlImage;

    if(image != null) {
      urlImage = await sendPhoto(image, pid);
    }

    final newParticipante = Participante(
      id: pid,
      refImage: urlImage ?? '',
      reunioes: participante.reunioes ?? [],
      nome: participante.nome,
      apelido: participante.apelido ?? '',
      rua: participante.rua ?? '',
      bairro: participante.bairro ?? '',
      cidade: participante.cidade ?? '',
      uf: participante.uf ?? '',
      celular: participante.celular,
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

  static Future<String> sendPhoto(Uint8List image, String nameImage) async {
    String imageUrl = '';

    try {
      storage.UploadTask uploadTask;

      storage.Reference ref = storage.FirebaseStorage.instance
        .ref()
        .child('images')
        .child('/' + nameImage);
      
      final metadata = storage.SettableMetadata(contentType: 'image');

      uploadTask = ref.putData(image, metadata);

      await uploadTask.whenComplete(() async {
        imageUrl = await ref.getDownloadURL();
      });
      ;

    } catch(e) {
      print(e);
    }

    return imageUrl;
  }
}