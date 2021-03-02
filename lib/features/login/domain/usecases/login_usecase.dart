import 'package:aventura_com_bako/core/routes.dart';
import 'package:aventura_com_bako/features/login/data/repositories/firebase_auth_repository.dart';
import 'package:aventura_com_bako/features/login/domain/entities/email.dart';
import 'package:aventura_com_bako/features/login/domain/entities/password.dart';
import 'package:aventura_com_bako/features/login/presentation/widgets/alert_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signIn(BuildContext context, String email, String password) async {
  if (email.isEmpty) {
    showAlertDialog(context, "Woops", "Você esqueceu de preencher seu email");
  } else if (password.isEmpty) {
    showAlertDialog(context, "Woops", "Você esqueceu de preencher sua senha");
  } else {
    try {
      Email login = Email(email);
      Password pass = Password(password);
      await FireAuth(FirebaseAuth.instance)
          .emailSignIn(login, pass)
          .then((value) => {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                )
              });
    } on WeakPasswordFailure {
      showAlertDialog(context, "Woops", "Essa senha está incorreta");
    } on InvalidEmailFailure {
      showAlertDialog(context, "Woops",
          "Esse email não parece válido, que tal tentar novamente?");
    } on FirebaseAuthException {
      showAlertDialog(
          context, "Woops", "Houve um erro na autenticação, tente novamente");
    }
  }
}
