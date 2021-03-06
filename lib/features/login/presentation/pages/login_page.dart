import 'package:aventura_com_bako/core/constants.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aventura_com_bako/features/login/presentation/widgets/login_input_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenController controller = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.3,
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage(
                      'assets/background-splash.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Center(
                  child: Container(
                    child: new Image.asset(
                      'assets/idv.png',
                      height: Get.height * 0.1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.02,
                    horizontal: Get.width * 0.05,
                  ),
                  alignment: Alignment.centerLeft,
                  child: TextInput(
                    texto: Texts.email,
                    tipoDeInput: TextInputType.emailAddress,
                    corDoCursor: Colors.green,
                    tamanhoDaFonte: 18,
                    habilitarCorretor: false,
                    habilitarSugestoes: true,
                    habilitarTextoObscuro: false,
                    corDePreenchimento: Colors.white.withOpacity(0.7),
                    controlador: controller.email.value,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.w, horizontal: 20.0.h),
                  child: TextInput(
                    texto: Texts.senha,
                    tipoDeInput: TextInputType.text,
                    corDoCursor: Colors.green,
                    tamanhoDaFonte: 18,
                    habilitarCorretor: false,
                    habilitarSugestoes: false,
                    habilitarTextoObscuro: true,
                    controlador: controller.password.value,
                    corDePreenchimento: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                  child: CheckboxListTile(
                    title: Text(
                      Texts.lembrarDeMim,
                      style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                    ),
                    value: controller.reminderPass.value,
                    onChanged: (value) {
                      controller.reminderPass.value = value;
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.12,
                ),
                Container(
                  width: Get.width,
                  height: Get.height * 0.08,
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.01,
                    horizontal: Get.width * 0.05,
                  ),
                  child: RaisedButton(
                    onPressed: () => controller.emailSignIn(),
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      Texts.entrar,
                      style: TextStyle(
                        fontSize: Get.height * 0.02,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  /*
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.tutorial, (route) => false);
                    },
                    style: ButtonStyle(textStyle: TextStyle(),)
                  ),*/
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.005),
                  child: Text(
                    'ou',
                    style: TextStyle(
                      fontSize: Get.height * 0.018,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Container(
                  width: Get.width,
                  height: Get.height * 0.08,
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.01,
                    horizontal: Get.width * 0.05,
                  ),
                  child: SignInButton(
                    Buttons.Facebook,
                    text: Texts.entrarComFacebook,
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.height * 0.08,
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.01,
                    horizontal: Get.width * 0.05,
                  ),
                  child: SignInButton(Buttons.Google,
                      text: Texts.entrarComGoogle, onPressed: () {}),
                ),
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 20.0.h),
                  child: InkWell(
                    child: new RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 18.0.sp,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: Texts.naoTemUmaConta),
                          new TextSpan(
                            text: Texts.registreSe,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => controller.goToSignUpPage(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
