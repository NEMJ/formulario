import 'package:file_picker/file_picker.dart';
import '../models/participante_model.dart';

abstract class DbService {
  static Future sendData(Participante participante) async {}
  sendPhoto(FilePickerResult? image);
  static getReunioes() {}
}