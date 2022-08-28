import 'package:aventura_com_bako/features/home/presentation/pages/bindings/home_binding.dart';
import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
        const Duration(seconds: 3),
        () => Get.offAll(() => const HomeScreen(),
            transition: Transition.zoom,
            duration: const Duration(seconds: 2),
            binding: HomeScreenBinding()));
  }
}
