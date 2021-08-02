import 'package:aventura_com_bako/features/login/presentation/pages/bindings/login_binding.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/login_page.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    // TODO: implement if user is logged, go to the HomeScreen, else go to the LoginScreen
    // if (player != null) {
    //    Get.off(HomeScreen());
    // }
    // Get.off(LoginScreen());
    //
    super.onReady();
    Future.delayed(
        Duration(seconds: 3),
        () => Get.offAll(() => LoginScreen(),
            transition: Transition.zoom,
            duration: Duration(seconds: 2),
            binding: LoginBinding()));
  }
}
