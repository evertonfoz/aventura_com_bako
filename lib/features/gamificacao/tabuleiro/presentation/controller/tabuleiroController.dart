
import 'package:get/get.dart';

import '../../data/model/informacoes_model.dart';
import '../../data/repositories/informacoes_repository_implementation.dart';

class InformacoesTabuleiroController extends GetxController {
  final InformacoesTabuleiroRepositoryImplementation
      informacoesRepositoryImplementation =
      InformacoesTabuleiroRepositoryImplementation();

  var informacoesTabuleiroList = <InformacoesModel>[].obs;

  Future getAllInformacoesTabuleiro() async {
    var response = await informacoesRepositoryImplementation.getInformacoes();
    if (response.isNotEmpty) {
      informacoesTabuleiroList.clear();
      informacoesTabuleiroList.addAll(response);
    }
  }
}
