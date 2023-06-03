class Participante {
  Participante({
    required this.id,
    required this.refImage,
    required this.reunioes,
    required this.nome,
    required this.apelido,
    required this.rua,
    required this.bairro,
    required this.cidade,
    required this.uf,
    required this.contato,
    required this.telFixo,
    required this.profissao,
    required this.formProf,
    required this.localTrabalho,
    required this.dataNascimento,
  });

  String id;
  String refImage;
  List<dynamic> reunioes;
  String nome;
  String apelido;
  String rua;
  String bairro;
  String cidade;
  String uf;
  String contato;
  String telFixo;
  String profissao;
  String formProf;
  String localTrabalho;
  String dataNascimento;
}