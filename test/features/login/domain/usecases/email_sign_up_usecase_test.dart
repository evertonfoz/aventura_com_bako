import 'dart:convert';
import 'dart:typed_data';

import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:aventura_com_bako/features/login/domain/repositories/auth_repository.dart';
import 'package:aventura_com_bako/features/login/domain/usecases/email_sign_up_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  EmailSignUpUsecase usecase;
  MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = EmailSignUpUsecase(repository);
  });

  List<dynamic> tSignUpData = [
    "gabrielstabile@alunos.utfpr.edu.br",
    "Mocked#password",
    "Gabriel Rocha Stabile",
    Image.network(
        "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
  ];

  Uint8List tData = base64Decode("");

  final PlayerEntity tPlayer = PlayerEntity(
      id: "Y2qemClJulWVJqIEuup9sxOhgjv1",
      name: "GABRIEL ROCHA STABILE",
      email: "gabrielstabile@alunos.utfpr.edu.br",
      avatar: Image.memory(tData),
      token: "EXAMPLE_JWT_TOKEN");
  test(
      'should return a PlayerEntity from repository when give a list of data for signUp ',
      () async {
    when(() => repository.signUpWithEmail(tSignUpData))
        .thenAnswer((_) async => Right(tPlayer));
    final result = await usecase(tSignUpData);
    expect(result, Right(tPlayer));
    verify(() => repository.signUpWithEmail(tSignUpData));
    verifyNoMoreInteractions(repository);
  });

  test('should return a InternetFailure when dont have internet conection',
      () async {
    when(() => repository.signUpWithEmail(tSignUpData))
        .thenAnswer((_) async => Left(InternetFailure()));

    final result = await usecase(tSignUpData);
    expect(result, Left(InternetFailure()));
    verify(() => repository.signUpWithEmail(tSignUpData));
    verifyNoMoreInteractions(repository);
  });

  test(
      'should return a AuthServerFailure when app cant connect with auth server',
      () async {
    when(() => repository.signUpWithEmail(tSignUpData))
        .thenAnswer((_) async => Left(AuthServerFailure()));

    final result = await usecase(tSignUpData);
    expect(result, Left(AuthServerFailure()));
    verify(() => repository.signUpWithEmail(tSignUpData));
    verifyNoMoreInteractions(repository);
  });

  test(
      'should return a EmailAlreadyInUseFailure when email already registred in auth server',
      () async {
    when(() => repository.signUpWithEmail(tSignUpData))
        .thenAnswer((_) async => Left(EmailAlreadyInUseFailure()));

    final result = await usecase(tSignUpData);
    expect(result, Left(EmailAlreadyInUseFailure()));
    verify(() => repository.signUpWithEmail(tSignUpData));
    verifyNoMoreInteractions(repository);
  });
}
