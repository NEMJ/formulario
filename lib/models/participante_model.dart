class Participante {
  Participante({
    this.id,
    this.refImage,
    this.reunioes,
    required this.nome,
    this.apelido,
    this.rua,
    this.bairro,
    this.cidade,
    this.uf,
    required this.contato,
    this.telFixo,
    this.profissao,
    this.formProf,
    this.localTrabalho,
    this.dataNascimento,
  });

  String? id;
  String? refImage;
  List<dynamic>? reunioes;
  String nome;
  String? apelido;
  String? rua;
  String? bairro;
  String? cidade;
  String? uf;
  String contato;
  String? telFixo;
  String? profissao;
  String? formProf;
  String? localTrabalho;
  String? dataNascimento;

  Map<String, dynamic> toJason() => {
    "id": id,
    "refImage": refImage ?? '',
    "reunioes": reunioes ?? [],
    "nome": nome,
    "apelido": apelido ?? '',
    "rua": rua ?? '',
    "bairro": bairro ?? '',
    "cidade": cidade ?? '',
    "uf": uf ?? '',
    "contato": contato,
    "telFixo": telFixo ?? '',
    "profissao": profissao ?? '',
    "formProf": formProf ?? '',
    "localTrabalho": localTrabalho ?? '',
    "dataNascimento": dataNascimento ?? ''
  };
}