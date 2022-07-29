import 'dart:convert';

List<InformacoesModel> informacoesModelFromJson(String str) =>
    List<InformacoesModel>.from(
        json.decode(str).map((x) => InformacoesModel.fromJson(x)));

class InformacoesModel {
  late String? idEspecie;
  late String? nomeCientifico;
  late String? nomesPopulares;
  late String? familia;
  late String? fenologia;
  late String? altura;
  late String? copa;
  late String? tronco;
  late String? flores;
  late String? folhas;
  late String? fruto;
  List<Assets>? assets;

  InformacoesModel(
      {this.idEspecie,
      this.nomeCientifico,
      this.nomesPopulares,
      this.familia,
      this.fenologia,
      this.altura,
      this.copa,
      this.tronco,
      this.flores,
      this.folhas,
      this.fruto});

  InformacoesModel.fromJson(Map<String, dynamic> json) {
    idEspecie = json['idEspecie'] as String?;
    nomeCientifico = json['nomeCientifico'] as String?;
    nomesPopulares = json['nomesPopulares'] as String?;
    familia = json['familia'] as String?;
    fenologia = json['fenologia'] as String?;
    altura = json['altura'] as String?;
    copa = json['copa'] as String?;
    tronco = json['tronco'] as String?;
    flores = json['flores'] as String?;
    folhas = json['folhas'] as String?;
    fruto = json['fruto'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idEspecie'] = idEspecie;
    data['nomeCientifico'] = nomeCientifico;
    data['nomesPopulares'] = nomesPopulares;
    data['familia'] = familia;
    data['fenologia'] = fenologia;
    data['altura'] = altura;
    data['copa'] = copa;
    data['tronco'] = tronco;
    data['flores'] = flores;
    data['folhas'] = folhas;
    data['fruto'] = fruto;
    return data;
  }
}

class Assets {
  String? url;

  Assets({this.url});

  Assets.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
