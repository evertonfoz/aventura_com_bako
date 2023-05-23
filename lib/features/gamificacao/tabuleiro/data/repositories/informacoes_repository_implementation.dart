import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/data/model/informacoes_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class InformacoesTabuleiroRepositoryImplementation {
  Future<List<InformacoesModel>> getInformacoes() async {
    var jsonString =
        await rootBundle.loadString('assets/informacoesTabuleiro.json');
    return informacoesModelFromJson(jsonString);
  }
}
