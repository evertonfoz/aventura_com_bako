import 'package:aventura_com_bako/features/informacoes_especies/data/model/informacoes_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class InformacoesRepositoryImplementation {
  Future<List<InformacoesModel>> getInformacoes() async {
    var jsonString =
        await rootBundle.loadString('assets/informacoesEspecies.json');
    return informacoesModelFromJson(jsonString);
  }
}
