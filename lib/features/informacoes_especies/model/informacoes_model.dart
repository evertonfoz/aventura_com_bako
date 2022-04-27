class InformacoesModel {
  late String idEspecie;
  late String nomeCientifico;
  late String nomePopular;
  late String familia;
  late String fenologia;
  late String altura;
  late String copa;
  late String tronco;
  late String flores;
  late String folhas;
  late String fruto;

  InformacoesModel(
      {required this.idEspecie,
      required this.nomeCientifico,
      required this.nomePopular,
      required this.familia,
      required this.fenologia,
      required this.altura,
      required this.copa,
      required this.tronco,
      required this.flores,
      required this.folhas,
      required this.fruto});

  InformacoesModel.fromJson(Map<String, dynamic> json) {
    idEspecie = json['idEspecie'];
    nomeCientifico = json['nomeCientifico'];
    nomePopular = json['nomesPopular'];
    familia = json['familia'];
    fenologia = json['fenologia'];
    altura = json['altura'];
    copa = json['copa'];
    tronco = json['tronco'];
    flores = json['flores'];
    folhas = json['folhas'];
    fruto = json['fruto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEspecie'] = this.idEspecie;
    data['nomeCientifico'] = this.nomeCientifico;
    data['nomesPopular'] = this.nomePopular;
    data['familia'] = this.familia;
    data['fenologia'] = this.fenologia;
    data['altura'] = this.altura;
    data['copa'] = this.copa;
    data['tronco'] = this.tronco;
    data['flores'] = this.flores;
    data['folhas'] = this.folhas;
    data['fruto'] = this.fruto;
    return data;
  }
}
