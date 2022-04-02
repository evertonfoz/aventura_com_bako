import 'package:aventura_com_bako/features/home/presentation/pages/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeScreenController>(HomeScreenController());
  }
}
