import 'package:file_picker/file_picker.dart';

abstract class DbService {
  sendData();
  sendPhoto(FilePickerResult? image);
  getReunioes();
}