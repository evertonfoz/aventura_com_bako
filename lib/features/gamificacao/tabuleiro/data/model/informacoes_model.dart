import 'dart:convert';

List<InformacoesModel> informacoesModelFromJson(String str) =>
    List<InformacoesModel>.from(
        json.decode(str).map((x) => InformacoesModel.fromJson(x)));

class InformacoesModel {
  int? id;
  int? value;
  String? result;
  String? texto;
  String? assets;
  String? audioURL;

  InformacoesModel({
    this.value,
    this.id,
    this.result,
    this.texto,
    this.assets,
    this.audioURL,
  });

  InformacoesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    value = json['value'] as int?;
    result = json['result'] as String?;
    texto = json['texto'] as String?;
    assets = json['assets'] as String?;
    audioURL = json['audioURL'] as String?;
  }

  InformacoesModel copyWith() {
    return InformacoesModel(
      value: value,
      result: result,
      texto: texto,
      assets: assets,
      audioURL: audioURL,
    );
  }
}
