import 'package:aventura_com_bako/features/informacoes_especies/data/model/informacoes_model.dart';
import 'package:aventura_com_bako/features/informacoes_especies/data/repositories/informacoes_repository_implementation.dart';
import 'package:get/get.dart';

class InformacoesEspeciesController extends GetxController {
  final InformacoesRepositoryImplementation
      informacoesRepositoryImplementation =
      InformacoesRepositoryImplementation();

  var informacoesEspeciesList = <InformacoesModel>[].obs;
  RxBool buscandoEspecieLida = true.obs;
  Rx<InformacoesModel> especieLida = InformacoesModel().obs;
  RxString valorQrCode = ''.obs;

  Future getAllInformacoesEspecies() async {
    buscandoEspecieLida(true);
    var response = await informacoesRepositoryImplementation.getInformacoes();
    if (response.isNotEmpty) {
      informacoesEspeciesList.clear();
      informacoesEspeciesList.addAll(response);
    }
  }

  Future getInformacaoEspecieLida() async {
    especieLida.value = informacoesEspeciesList[
        informacoesEspeciesList.indexWhere((element) =>
            element.idEspecie == valorQrCode.value.replaceAll('"', ''))];
    buscandoEspecieLida(false);
  }
}
