import 'dart:convert';
import 'dart:typed_data';

import 'package:aventura_com_bako/features/login/data/datasources/auth_datasource.dart';
import 'package:aventura_com_bako/features/login/data/model/player_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements firebaseAuth.FirebaseAuth {}

void main() {
  AuthDatasourceImplementation datasource;

  MockFirebaseAuth mockFirebaseAuth;
  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    datasource = AuthDatasourceImplementation(firebaseAuth: mockFirebaseAuth);
  });

  final tEmail = "gabrielstabile@alunos.utfpr.edu.br";
  final tPassword = "Mocked@Password";
  Uint8List tData = base64Decode("");

  final tPlayerModel = PlayerModel(
      id: "Y2qemClJulWVJqIEuup9sxOhgjv1",
      name: "GABRIEL ROCHA STABILE",
      email: "gabrielstabile@alunos.utfpr.edu.br",
      avatar: Image.memory(tData),
      token: "EXAMPLE_JWT_TOKEN");
  var tUser;
  test('''should do a request for FirebaseAuth to login user with 
      email and password''', () async {
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
        email: tEmail,
        password: tPassword)).thenAnswer((_) async => firebaseAuth.UserCredential);

    final result = datasource.loginWithEmail(tEmail, tPassword);

    expect(result, tPlayerModel);
  });
}
