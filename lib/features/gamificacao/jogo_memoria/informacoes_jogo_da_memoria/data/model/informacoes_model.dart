import 'dart:convert';

import 'package:aventura_com_bako/features/informacoes_especies/helpers/enums/informacoes_especies_enum.dart';

List<InformacoesModel> informacoesModelFromJson(String str) =>
    List<InformacoesModel>.from(
        json.decode(str).map((x) => InformacoesModel.fromJson(x)));

class InformacoesModel {
  int? id;
  String? titulo;
  String? texto;
  String? assets;
  InformacoesEspeciesEnum? informacoesEspeciesEnum;
  bool? especieDescoberta;
  int? numDescobertas;

  bool get especieRepetidaNaTrilha =>
      informacoesEspeciesEnum == InformacoesEspeciesEnum.AspidospermaPolyneuron;

  InformacoesModel({
    this.id,
    this.titulo,
    this.texto,
    this.informacoesEspeciesEnum,
    this.assets,
    this.especieDescoberta,
    this.numDescobertas,
  });

  InformacoesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    titulo = json['titulo'] as String?;
    texto = json['texto'] as String?;
    informacoesEspeciesEnum =
        InformacoesEspeciesEnum.values.asNameMap()[json['enum']];
    especieDescoberta = false;
    numDescobertas = 0;
    assets = json['assets'] as String?;
  }

  InformacoesModel copyWith({
    bool? especieDescoberta,
    int? numDescobertas,
  }) {
    return InformacoesModel(
      especieDescoberta: especieDescoberta ?? this.especieDescoberta,
      numDescobertas: numDescobertas ?? this.numDescobertas,
      titulo: titulo,
      texto: texto,
      informacoesEspeciesEnum: informacoesEspeciesEnum,
      assets: assets,
    );
  }
}
