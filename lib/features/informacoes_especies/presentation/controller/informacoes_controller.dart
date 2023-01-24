import 'package:aventura_com_bako/features/informacoes_especies/data/model/informacoes_model.dart';
import 'package:aventura_com_bako/features/informacoes_especies/data/repositories/informacoes_repository_implementation.dart';
import 'package:get/get.dart';

class InformacoesEspeciesController extends GetxController {
  final InformacoesRepositoryImplementation
      informacoesRepositoryImplementation =
      InformacoesRepositoryImplementation();

  var informacoesEspeciesList = <InformacoesModel>[].obs;
  RxBool buscandoEspecieLida = false.obs;
  Rx<InformacoesModel> especieLida = InformacoesModel().obs;
  RxString valorQrCode = ''.obs;

  Future getAllInformacoesEspecies() async {
    var response = await informacoesRepositoryImplementation.getInformacoes();
    if (response.isNotEmpty) {
      informacoesEspeciesList.clear();
      informacoesEspeciesList.addAll(response);
    }
  }

  Future getInformacaoEspecieLida() async {
    buscandoEspecieLida(true);
    try {
      especieLida.value = informacoesEspeciesList[
          informacoesEspeciesList.indexWhere((element) =>
              element.idEspecie == valorQrCode.value.replaceAll('"', ''))];
    } catch (e) {
      rethrow;
    } finally {
      await Future.delayed(const Duration(seconds: 1));
      buscandoEspecieLida(false);
    }
  }

  void setEspecieLida() {
    int index = informacoesEspeciesList
        .indexWhere((e) => e.idEspecie == especieLida.value.idEspecie);
    informacoesEspeciesList[index] = especieLida.value.copyWith(
        especieDescoberta: true,
        numDescobertas: especieLida.value.numDescobertas! + 1);
  }

  void resertEspecieLida() {
    especieLida = InformacoesModel().obs;
  }
}
