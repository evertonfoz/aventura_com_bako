import 'package:aventura_com_bako/core/routes.dart';
import 'package:aventura_com_bako/features/login/data/repositories/firebase_auth_repository.dart';
import 'package:aventura_com_bako/features/login/domain/entities/email.dart';
import 'package:aventura_com_bako/features/login/domain/entities/password.dart';
import 'package:aventura_com_bako/features/login/presentation/widgets/alert_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signUp(BuildContext context, String nome, String email,
    String password, String name, Image avatar) async {
  try {
    Email login = Email(email);
    Password pass = Password(password);
    await FireAuth(FirebaseAuth.instance)
        .emailSignUp(login, pass)
        .then((value) => {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.home,
                (route) => false,
              )
            });
  } on FirebaseAuthException {
    showAlertDialog(
        context, "Woops", "Houve um erro na autenticação, tente novamente");
  }
}
