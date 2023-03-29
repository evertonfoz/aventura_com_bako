import 'package:aventura_com_bako/features/informacoes_especies/data/model/informacoes_model.dart';
import 'package:aventura_com_bako/features/informacoes_especies/data/repositories/informacoes_repository_implementation.dart';
import 'package:get/get.dart';

class InformacoesGalleryController extends GetxController {
  final InformacoesRepositoryImplementation
      informacoesRepositoryImplementation =
      InformacoesRepositoryImplementation();

  var informacoesEspeciesList = <InformacoesModel>[].obs;

  Future getAllInformacoesEspecies() async {
    var response = await informacoesRepositoryImplementation.getInformacoes();
    if (response.isNotEmpty) {
      informacoesEspeciesList.clear();
      informacoesEspeciesList.addAll(response);
    }
  }

}
