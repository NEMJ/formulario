import 'package:cloud_firestore/cloud_firestore.dart';

class Reuniao {
  Reuniao({
    required this.id,
    required this.descricao,
    required this.entidade,
    required this.diaSemana,
    required this.horarioInicio,
    required this.horarioTermino,
  });

  String id;
  String descricao;
  String entidade;
  String diaSemana;
  String horarioInicio;
  String horarioTermino;

  factory Reuniao.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Reuniao(
      id: snapshot['id'],
      descricao: snapshot['descricao'],
      entidade: snapshot['entidade'],
      diaSemana: snapshot['diaSemana'],
      horarioInicio: snapshot['horarioInicio'],
      horarioTermino: snapshot['horarioTermino'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "descricao": descricao,
    "entidade": entidade,
    "diaSemana": diaSemana,
    "horarioInicio": horarioInicio,
    "horarioTermino": horarioTermino,
  };
}