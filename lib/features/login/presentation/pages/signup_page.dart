import 'package:aventura_com_bako/features/login/presentation/store/signup_store.dart';
import 'package:aventura_com_bako/features/login/presentation/widgets/login_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

// TODO: Avisar caso a senha não for válida (Store já verifica isso, só falta implementar o aviso ErrorText)
// TODO: Avisar caso o email não for válido (Store já verifica isso, só falta implementar o aviso ErrorText)
// TODO: Avisar caso as senhas não forem iguais (Store já verifica isso, só falta implementar o aviso ErroText)

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkTerms = false;

  SignUpStore store = SignUpStore();

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
                      Observer(builder: (_) {
                        return CircleAvatar(
                            radius: 50,
                            backgroundImage: store.avatar != null
                                ? store.avatar.image
                                : null);
                      }),
                      Positioned(
                        top: 52,
                        left: 32,
                        child: RawMaterialButton(
                          onPressed: () => store.getGaleryImage(),
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
                TextInput(
                  texto: "Nome",
                  tamanhoDaFonte: 15,
                  corDePreenchimento: Colors.white.withOpacity(0.7),
                  onChanged: store.setName,
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                TextInput(
                  texto: "E-mail",
                  tipoDeInput: TextInputType.emailAddress,
                  tamanhoDaFonte: 15,
                  corDePreenchimento: Colors.white.withOpacity(0.7),
                  onChanged: store.setEmail,
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                TextInput(
                  texto: "Senha",
                  tipoDeInput: TextInputType.text,
                  tamanhoDaFonte: 15,
                  habilitarCorretor: false,
                  habilitarSugestoes: false,
                  habilitarTextoObscuro: true,
                  corDePreenchimento: Colors.white.withOpacity(0.7),
                  onChanged: store.setPassword,
                ),
                SizedBox(height: screenSize.height * 0.03),
                TextInput(
                  texto: "Confirme sua senha",
                  tipoDeInput: TextInputType.text,
                  tamanhoDaFonte: 15,
                  habilitarCorretor: false,
                  habilitarSugestoes: false,
                  habilitarTextoObscuro: true,
                  corDePreenchimento: Colors.white.withOpacity(0.7),
                  onChanged: store.setConfirmedPassword,
                ),
                SizedBox(height: screenSize.height * 0.04),
                CheckboxListTile(
                  activeColor: Colors.white,
                  checkColor: Colors.green,
                  title: Text(
                    "Concordo com os termos e condições e com a política de privacidade",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  value: checkTerms,
                  onChanged: (value) {
                    setState(() {
                      checkTerms = value;
                    });
                  },
                ),
                SizedBox(height: screenSize.height * 0.04),
                Observer(builder: (_) {
                  return ButtonTheme(
                    minWidth: double.infinity,
                    height: screenSize.height * 0.06,
                    child: RaisedButton(
                      onPressed: store.isFormValid
                          ? () {
                              print("Form valido");
                            }
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
                  );
                }),
              ],
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
