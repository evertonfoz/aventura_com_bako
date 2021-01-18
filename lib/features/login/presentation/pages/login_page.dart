import 'package:aventura_com_bako/core/constants.dart';
import 'package:aventura_com_bako/core/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aventura_com_bako/features/login/presentation/widgets/login_input_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool reminderPass = false;

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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: Container(
                    child: new Image.asset(
                      'assets/idv.png',
                      height: MediaQuery.of(context).size.height * 0.1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  alignment: Alignment.centerLeft,
                  child: TextInput(
                    texto: Texts.usuarioOuEmail,
                    tipoDeInput: TextInputType.emailAddress,
                    corDoCursor: Colors.green,
                    tamanhoDaFonte: 18,
                    habilitarCorretor: false,
                    habilitarSugestoes: true,
                    habilitarTextoObscuro: false,
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
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                  child: CheckboxListTile(
                    title: Text(
                      Texts.lembrarDeMim,
                      style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                    ),
                    value: reminderPass,
                    onChanged: (value) {
                      setState(() {
                        reminderPass = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.tutorial, (route) => false);
                    },
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      Texts.entrar,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.005),
                  child: Text(
                    'ou',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: SignInButton(
                    Buttons.Facebook,
                    text: Texts.entrarComFacebook,
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: SignInButton(
                    Buttons.Google,
                    text: Texts.entrarComGoogle,
                    onPressed: () {},
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
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
                    onTap: () {},
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
