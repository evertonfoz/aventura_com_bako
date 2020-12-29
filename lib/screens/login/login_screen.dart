import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Usuário ou E-mail",
                        fillColor: Colors.white.withOpacity(0.7),
                        filled: true,
                        border: InputBorder.none
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey),
                        // ),
                        // border: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey),
                        // ),
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey),
                        // ),
                        ),
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.green,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.w, horizontal: 20.0.h),
                  // alignment: Alignment.centerLeft,
                  // height: 60.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Senha",
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      border: InputBorder.none,

                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.grey),
                      // ),
                      // border: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.grey),
                      // ),
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.grey),
                      // ),
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                  child: CheckboxListTile(
                    title: Text(
                      "Lembrar de mim?",
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
                      'ENTRAR',
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
                    text: "ENTRAR COM FACEBOOK",
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
                    text: "ENTRAR COM GOOGLE",
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
                          new TextSpan(text: 'Não tem uma conta? '),
                          new TextSpan(
                            text: 'Registre-se',
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
