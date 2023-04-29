import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/data/model/informacoes_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/data/repositories/informacoes_repository_implementation.dart';
import 'package:get/get.dart';

class InformacoesJogoDaMemoriaController extends GetxController {
  final InformacoesJogoMemoriaRepositoryImplementation
      informacoesRepositoryImplementation =
      InformacoesJogoMemoriaRepositoryImplementation();

  var informacoesJogoDaMemoriaList = <InformacoesModel>[].obs;

  Future getAllInformacoesJogoDaMemoria() async {
    var response = await informacoesRepositoryImplementation.getInformacoes();
    if (response.isNotEmpty) {
      informacoesJogoDaMemoriaList.clear();
      informacoesJogoDaMemoriaList.addAll(response);
    }
  }
}
