import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import './db_service.dart';
import 'package:file_picker/file_picker.dart';

class FirebaseService extends DbService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  getReunioes() {}

  @override
  sendData() {}

  @override
  sendPhoto(FilePickerResult? image) {}
}