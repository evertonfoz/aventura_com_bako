import 'package:aventura_com_bako/features/login/domain/entities/email.dart';
import 'package:aventura_com_bako/features/login/domain/entities/password.dart';
import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  final FirebaseAuth _auth;
  FireAuth(this._auth);

  Stream<User> get authState => _auth.authStateChanges();

  Future<dynamic> emailSignIn(Email email, Password password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.value, password: password.value);
      User fireUser = userCredential.user;

      Player player = new Player(
          id: fireUser.uid,
          email: fireUser.email,
          name: fireUser.displayName,
          imgURL: fireUser.photoURL);

      return player;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        throw e;
      } else {
        throw e;
      }
    }
  }

  // Todo: Jogar Exception caso o email já esteja cadastrado
  Future<dynamic> emailSignUp(Email email, Password password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.value, password: password.value);
      User fireUser = userCredential.user;

      Player player = new Player(
          id: fireUser.uid,
          email: fireUser.email,
          name: fireUser.displayName,
          imgURL: fireUser.photoURL);

      return player;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
}
