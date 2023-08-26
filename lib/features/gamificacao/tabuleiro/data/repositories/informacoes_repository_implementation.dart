
import 'package:flutter/services.dart' show rootBundle;

import '../model/informacoes_model.dart';

class InformacoesTabuleiroRepositoryImplementation {
  Future<List<InformacoesModel>> getInformacoes() async {
    var jsonString =
        await rootBundle.loadString('assets/informacoesTabuleiro.json');
    return informacoesModelFromJson(jsonString);
  }
}
