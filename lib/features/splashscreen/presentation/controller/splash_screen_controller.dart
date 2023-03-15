import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/home/presentation/pages/bindings/home_binding.dart';
import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
        const Duration(seconds: 1),
        () => Get.offAll(() => const HomeScreen(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500),
            binding: HomeScreenBinding()));
  }
}
