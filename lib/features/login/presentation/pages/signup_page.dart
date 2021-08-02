import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/signup_screen_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpScreenController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/Padrão4.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: screenSize.height * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Crie sua \nconta",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            height: 1.2,
                            color: Colors.white),
                      ),
                      Stack(children: <Widget>[
                        Obx(() => CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  controller.avatar.value.image != null
                                      ? controller.avatar.value.image
                                      : null,
                            )),
                        Positioned(
                          top: 52,
                          left: 32,
                          child: RawMaterialButton(
                            onPressed: () => controller.getGaleryImage(),
                            fillColor: Colors.green.shade100,
                            child: Icon(
                              Icons.add_photo_alternate,
                              size: 25,
                              color: Colors.green.shade900,
                            ),
                            padding: EdgeInsets.all(10.0),
                            shape: CircleBorder(),
                          ),
                        ),
                      ])
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.07),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nome",
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      border: InputBorder.none,
                    ),
                    validator: (_) {
                      if (_.isEmpty) {
                        return "Campo obrigatório";
                      } else {
                        return null;
                      }
                    },
                    style: TextStyle(fontSize: 15),
                    controller: controller.displayName.value,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      border: InputBorder.none,
                    ),
                    validator: (_) {
                      if (_.isEmpty) {
                        return "Campo obrigatório";
                      } else if (!_.isEmail) {
                        return "E-mail inválido";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 15),
                    controller: controller.email.value,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Senha (mais de 6 caracteres)",
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      border: InputBorder.none,
                    ),
                    validator: (_) {
                      if (_.isEmpty) {
                        return "Campo obrigatório";
                      } else if (_.length < 6) {
                        return "A senha precisa ter mais que 6 caracteres";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: true,
                    controller: controller.password.value,
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Confirme sua senha",
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      border: InputBorder.none,
                    ),
                    validator: (_) {
                      if (_.isEmpty) {
                        return "Campo obrigatório";
                      } else if (_ != controller.password.value.text) {
                        return "As senhas não coincidem";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: true,
                    onChanged: (value) =>
                        controller.confirmedPassword.value = value,
                  ),
                  SizedBox(height: screenSize.height * 0.04),
                  Obx(() => CheckboxListTile(
                        activeColor: Colors.white,
                        checkColor: Colors.green,
                        title: Text(
                          "Concordo com os termos e condições e com a política de privacidade",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        value: controller.checkTerms.value,
                        onChanged: (value) {
                          controller.checkTerms.value = value;
                        },
                      )),
                  SizedBox(height: screenSize.height * 0.04),
                  ButtonTheme(
                    minWidth: double.infinity,
                    height: screenSize.height * 0.06,
                    child: RaisedButton(
                      onPressed: () => _formKey.currentState.validate()
                          ? controller.signUp()
                          : null,
                      textColor: Colors.white,
                      color: Colors.green.shade300,
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontSize: screenSize.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.05,
            left: screenSize.width * 0.04,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              fillColor: Colors.green.shade100,
              child: Icon(
                Icons.arrow_back_rounded,
                size: 28,
                color: Colors.green.shade900,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
              constraints: BoxConstraints(minHeight: 0),
            ),
          ),
        ]),
      ),
    );
  }
}
