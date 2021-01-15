import 'package:aventura_com_bako/core/constants.dart';
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
                height: double.infinity,
                width: double.infinity,
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
                  height: 60.h,
                ),
                Center(
                  child: Container(
                    child: new Image.asset(
                      'assets/idv.png',
                      height: 80.0.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.w, horizontal: 20.0.h),
                  alignment: Alignment.centerLeft,
                  child: TextInput(
                    texto: Textos.usuarioOuEmail,
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
                    texto: Textos.senha,
                    tipoDeInput: TextInputType.text,
                    corDoCursor: Colors.green,
                    tamanhoDaFonte: 18,
                    habilitarCorretor: false,
                    habilitarSugestoes: false,
                    habilitarTextoObscuro: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                  child: CheckboxListTile(
                    title: Text(
                      Textos.lembrarDeMim,
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
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  height: 90.h,
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0.w, horizontal: 20.0.h),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/tutorial');
                    },
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      Textos.entrar,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Text(
                    'ou',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 65.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 20.0.h),
                  child: SignInButton(
                    Buttons.Facebook,
                    text: Textos.entrarComFacebook,
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 65.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 20.0.h),
                  child: SignInButton(
                    Buttons.Google,
                    text: Textos.entrarComGoogle,
                    onPressed: () {},
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
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
                          new TextSpan(text: Textos.naoTemUmaConta),
                          new TextSpan(
                            text: Textos.registreSe,
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
