import 'dart:convert';

import 'package:aventura_com_bako/features/informacoes_especies/helpers/enums/informacoes_especies_enum.dart';
import 'package:flutter/material.dart';

List<InformacoesModel> informacoesModelFromJson(String str) =>
    List<InformacoesModel>.from(
        json.decode(str).map((x) => InformacoesModel.fromJson(x)));

class InformacoesModel {
  String? idEspecie;
  String? nomeCientifico;
  String? nomesPopulares;
  String? familia;
  String? fenologia;
  String? altura;
  String? copa;
  String? tronco;
  String? flores;
  String? folhas;
  String? fruto;
  String? assets;
  InformacoesEspeciesEnum? informacoesEspeciesEnum;
  bool? especieDescoberta;
  int? numDescobertas;

  bool get especieRepetidaNaTrilha =>
      informacoesEspeciesEnum == InformacoesEspeciesEnum.AspidospermaPolyneuron;

  InformacoesModel({
    this.idEspecie,
    this.nomeCientifico,
    this.nomesPopulares,
    this.familia,
    this.fenologia,
    this.altura,
    this.copa,
    this.tronco,
    this.flores,
    this.folhas,
    this.fruto,
    this.informacoesEspeciesEnum,
    this.assets,
    this.especieDescoberta,
    this.numDescobertas,
  });

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
      fenologia: fenologia,
      altura: altura,
      copa: copa,
      tronco: tronco,
      flores: flores,
      folhas: folhas,
      fruto: fruto,
      informacoesEspeciesEnum: informacoesEspeciesEnum,
      assets: assets,
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
