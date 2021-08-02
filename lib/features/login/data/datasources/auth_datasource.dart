import 'package:aventura_com_bako/core/errors/exceptions.dart';
import 'package:aventura_com_bako/features/login/data/model/player_model.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class IAuthDatasource {
  Future<PlayerModel> loginWithEmail(String email, String password);
  Future<PlayerModel> loginWithGoogle();
  Future<bool> signUpWithEmail(
      String email, String password, String name, String avatar);
  Future<PlayerModel> getUserLogged();
}

class AuthDatasourceImplementation implements IAuthDatasource {
  final FirebaseAuth firebaseAuth;

  AuthDatasourceImplementation({@required this.firebaseAuth});

  @override
  Future<PlayerModel> loginWithEmail(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      var token = await credential.user.getIdToken();

      return PlayerModel(
        id: credential.user.uid,
        name: credential.user.displayName,
        email: credential.user.email,
        avatar: Image.network(credential.user.photoURL ??
            'https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png'),
        token: token,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email' ||
          e.code == 'wrong-password' ||
          e.code == 'user-not-found') {
        throw InvalidCredentialsException();
      } else {
        throw InvalidCredentialsException();
      }
    }
  }

  @override
  Future<PlayerModel> loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);

    return PlayerModel(
      id: userCredential.user.uid,
      name: userCredential.user.displayName,
      email: userCredential.user.email,
      avatar: Image.network(userCredential.user.photoURL),
      token: await userCredential.user.getIdToken(),
    );
  }

  @override
  Future<PlayerModel> getUserLogged() async {
    final user = firebaseAuth.currentUser;

    if (user != null) {
      return PlayerModel(
        id: user.uid,
        name: user.displayName,
        email: user.email,
        avatar: Image.network(user.photoURL),
        token: await user.getIdToken(),
      );
    } else {
      return null;
    }
  }

  @override
  Future<bool> signUpWithEmail(
      String email, String password, String name, String avatar) async {
    try {
      HttpsCallable registroDeUsuario =
          FirebaseFunctions.instance.httpsCallable('registerUser');

      await registroDeUsuario.call(<String, dynamic>{
        'email': email,
        'password': password,
        'displayName': name,
        'imgByte': avatar,
      });

      return true;
    } on FirebaseFunctionsException {
      throw ServerException();
    }
  }
}
