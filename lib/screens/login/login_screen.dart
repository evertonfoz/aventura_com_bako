import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 75.0),
                      child: new Image.asset(
                        'assets/idv.png',
                        height: 80.0,
                        fit: BoxFit.cover,
                      ))),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Usuário ou E-mail",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.green,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                alignment: Alignment.centerLeft,
                height: 60.0,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Senha",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CheckboxListTile(
                  title: Text(
                    "Lembrar de mim",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 90.0,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    color: Colors.green,
                    child: const Text('ENTRAR',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal)),
                  )),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Text(
                  'ou',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
              ),
              Container(
                width: double.infinity,
                height: 65,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: SignInButton(
                  Buttons.Facebook,
                  text: "ENTRAR COM FACEBOOK",
                  onPressed: () {},
                ),
              ),
              Container(
                width: double.infinity,
                height: 65,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: SignInButton(
                  Buttons.Google,
                  text: "ENTRAR COM GOOGLE",
                  onPressed: () {},
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: InkWell(
                  child: new RichText(
                    text: new TextSpan(
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Não tem uma conta? '),
                        new TextSpan(
                            text: 'Registre-se',
                            style: new TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}
