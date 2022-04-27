import 'package:aventura_com_bako/features/qrcode/presentation/pages/bindings/qrcode_scanner_binding.dart';
import 'package:aventura_com_bako/features/qrcode/presentation/pages/qrcode_scanner_page.dart';
import 'package:get/get.dart';

class BakoController extends GetxController {
  void navigateQrCode() {
    Get.off(() => QrCodeScannerPage(),
        transition: Transition.zoom,
        duration: Duration(seconds: 2),
        binding: QrCodeScannerBinding());
  }
}
