import 'package:aventura_com_bako/features/informacoes_especies/presentation/bindings/informacoes_especies_binding.dart';
import 'package:aventura_com_bako/features/informacoes_especies/presentation/pages/infomacoes_especies_page.dart';
import 'package:get/get.dart';

class QrCodeController extends GetxController {
  void navigateInformacoesEspecies(String? valorLido) {
    Get.off(
        () => InformacoesEspeciesPage(
              valorLido: '$valorLido',
            ),
        transition: Transition.zoom,
        duration: Duration(seconds: 2),
        binding: InformacoesEspeciesBinding());
  }
}
