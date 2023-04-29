import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/data/model/informacoes_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class InformacoesJogoMemoriaRepositoryImplementation {
  Future<List<InformacoesModel>> getInformacoes() async {
    var jsonString =
        await rootBundle.loadString('assets/informacoesMemoria.json');
    return informacoesModelFromJson(jsonString);
  }
}
