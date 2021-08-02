import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:aventura_com_bako/features/login/data/datasources/hasura_datasource.dart';
import 'package:aventura_com_bako/features/login/domain/usecases/email_login_usecase.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/bindings/signup_binding.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  EmailLoginUsecase usecase = Get.find<EmailLoginUsecase>();
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  var reminderPass = false.obs;
  SignInParams dados;

  void goToSignUpPage() {
    Get.to(() => SignUpScreen(),
        transition: Transition.native,
        duration: Duration(milliseconds: 800),
        binding: SignUpBiding());
  }

  void emailSignIn() async {
    dados =
        SignInParams(email: email.value.text, password: password.value.text);
    final failureOrPlayer = await usecase.call(dados);
    failureOrPlayer.fold(
        (l) => Get.defaultDialog(title: 'Woops', middleText: l.message),
        (r) => HasuraDatasource().complementInformation(r).then((value) =>
            Get.offAll(() => HomeScreen(),
                arguments: value,
                transition: Transition.native,
                duration: Duration(seconds: 1))));
  }
}
