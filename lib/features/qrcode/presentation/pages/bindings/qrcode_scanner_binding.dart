import 'package:aventura_com_bako/features/qrcode/presentation/pages/controllers/qrcode_scanner_controller.dart';
import 'package:get/get.dart';

class QrCodeScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<QrCodeController>(QrCodeController());
  }
}
