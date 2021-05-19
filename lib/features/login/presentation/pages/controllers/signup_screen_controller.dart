import 'dart:convert';

import 'package:aventura_com_bako/core/constants.dart';
import 'package:aventura_com_bako/features/login/domain/usecases/email_login_usecase.dart';
import 'package:aventura_com_bako/features/login/domain/usecases/email_sign_up_usecase.dart';
import 'package:aventura_com_bako/features/tutorial/presentation/pages/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreenController extends GetxController {
  var confirmedPassword = ''.obs;
  var checkTerms = false.obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> displayName = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  var avatar = Image.asset("assets/bako_vetor.png").obs;
  var base64Avatar = Texts.defaultBase64Avatar.obs;
  EmailSignUpUsecase usecase = Get.find<EmailSignUpUsecase>();
  EmailLoginUsecase loginUsecase = Get.find<EmailLoginUsecase>();

  Future<void> getGaleryImage() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedImage != null) {
      avatar.value = Image.memory(await pickedImage.readAsBytes());
      base64Avatar.value = base64Encode(await pickedImage.readAsBytes());
    }
  }

  void signUp() async {
    var dados = SignUpParams(
        email: email.value.text,
        password: password.value.text,
        avatar: base64Avatar.value,
        name: displayName.value.text);
    var dadosLogin =
        SignInParams(email: email.value.text, password: password.value.text);
    var signUpResult = await usecase.call(dados);

    signUpResult.fold(
        (l) => Get.defaultDialog(title: 'Woops', middleText: l.message),
        (r) async => loginUsecase.call(dadosLogin).then((loginResult) =>
            loginResult.fold(
                (l) => Get.defaultDialog(title: 'Woops', middleText: l.message),
                (r) => Get.offAll(TutorialPage(),
                    arguments: r,
                    transition: Transition.native,
                    duration: Duration(seconds: 1)))));
  }
}
