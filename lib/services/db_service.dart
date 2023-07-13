import 'package:file_picker/file_picker.dart';
import '../models/participante_model.dart';

abstract class DbService {
  static sendData(Participante participante) {}
  sendPhoto(FilePickerResult? image);
  static getReunioes() {}
}