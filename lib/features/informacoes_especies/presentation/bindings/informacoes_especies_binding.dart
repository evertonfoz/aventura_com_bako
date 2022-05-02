import 'package:aventura_com_bako/features/informacoes_especies/presentation/controller/informacoes_controller.dart';
import 'package:get/get.dart';

class InformacoesEspeciesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InformacoesEspeciesController>(InformacoesEspeciesController());
  }
}
