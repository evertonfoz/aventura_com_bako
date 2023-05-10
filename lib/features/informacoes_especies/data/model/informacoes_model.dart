import 'dart:convert';

import 'package:aventura_com_bako/features/informacoes_especies/helpers/enums/informacoes_especies_enum.dart';
import 'package:flutter/material.dart';

List<InformacoesModel> informacoesModelFromJson(String str) =>
    List<InformacoesModel>.from(
        json.decode(str).map((x) => InformacoesModel.fromJson(x)));

class InformacoesModel {
  int? id;
  String? idEspecie;
  String? nomeCientifico;
  String? nomesPopulares;
  String? familia;
  String? exposicao;
  String? assets;
  String? audioURL;
  InformacoesEspeciesEnum? informacoesEspeciesEnum;
  bool? especieDescoberta;
  int? numDescobertas;

  bool get especieRepetidaNaTrilha =>
      informacoesEspeciesEnum == InformacoesEspeciesEnum.AspidospermaPolyneuron;

  InformacoesModel({
    this.id,
    this.idEspecie,
    this.nomeCientifico,
    this.nomesPopulares,
    this.familia,
    this.exposicao,
    this.informacoesEspeciesEnum,
    this.assets,
    this.audioURL,
    this.especieDescoberta,
    this.numDescobertas,
  });

  InformacoesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    idEspecie = json['idEspecie'] as String?;
    nomeCientifico = json['nomeCientifico'] as String?;
    nomesPopulares = json['nomesPopulares'] as String?;
    familia = json['familia'] as String?;
    exposicao = json['exposicao'] as String?;
    audioURL = json['audioURL'] as String?;
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
      idEspecie: idEspecie,
      nomeCientifico: nomeCientifico,
      nomesPopulares: nomesPopulares,
      familia: familia,
      exposicao: exposicao,
      informacoesEspeciesEnum: informacoesEspeciesEnum,
      assets: assets,
      audioURL: audioURL,
    );
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
