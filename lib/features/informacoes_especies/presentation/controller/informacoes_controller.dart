import 'package:aventura_com_bako/features/informacoes_especies/data/model/informacoes_model.dart';
import 'package:aventura_com_bako/features/informacoes_especies/data/repositories/informacoes_repository_implementation.dart';
import 'package:get/get.dart';

class InformacoesEspeciesController extends GetxController {
  final InformacoesRepositoryImplementation
      informacoesRepositoryImplementation =
      InformacoesRepositoryImplementation();

  var informacoesEspeciesList = <InformacoesModel>[].obs;
  var isLoading = true.obs;

  late var informacoes = InformacoesModel(
          idEspecie: "Paineira-rosa",
          nomeCientifico: "Ceiba Speciosa",
          nomePopular:
              "Paineira, Paineira-rosa, Paina-de-seda, Barriguda, Sumaúma, Árvore-de-lã, Árvore-de-paina, Paineira-de-espinho.",
          familia: "Malvaceae",
          fenologia:
              "A floração ocorre de fevereiro à abril e a frutificação de abril à outubro.",
          altura: "Pode atingir até 30 metros (árvore de grande porte).",
          copa: "Ampla e muito ramificada",
          tronco:
              "Retilíneo e cilíndrico, geralmente com engrossamento próximo à base; com casca externa estriada de coloração verde-escura, com acúleos cônicos principalmente na fase jovem.",
          flores:
              "Coloração rosa-intenso, vistosas, pentâmeras e hermafroditas",
          folhas: "Alternas, digitadas e pecioladas, com 5 a 8 folíolos",
          fruto:
              "Cápsulas de até 17 cm contendo numerosas sementes envoltas por painas brancas. ")
      .obs;

  void getInformacoesEspecies() async {
    try {
      isLoading(true);
      var response = await informacoesRepositoryImplementation.getInformacoes();

      if (response.isNotEmpty) {
        informacoesEspeciesList.clear();
        informacoesEspeciesList.addAll(response);
      }
    } finally {
      isLoading(false);
    }
  }
}
