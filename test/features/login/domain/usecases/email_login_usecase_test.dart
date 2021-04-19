import 'dart:convert';
import 'dart:typed_data';

import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:aventura_com_bako/features/login/domain/repositories/auth_repository.dart';
import 'package:aventura_com_bako/features/login/domain/usecases/email_login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  EmailLoginUsecase usecase;
  MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = EmailLoginUsecase(repository);
  });

  SignInParams tLoginData = SignInParams(
      email: 'gabrielstabile@alunos.utfpr.edu.br', password: 'Mocked@Password');

  Uint8List tData = base64Decode("");

  final PlayerEntity tPlayer = PlayerEntity(
      id: "Y2qemClJulWVJqIEuup9sxOhgjv1",
      name: "GABRIEL ROCHA STABILE",
      email: "gabrielstabile@alunos.utfpr.edu.br",
      avatar: Image.memory(tData),
      token: "EXAMPLE_JWT_TOKEN");

  test('should get PlayerEntity from repository with email and password',
      () async {
    when(() => repository.loginWithEmail(
        email: tLoginData.email,
        password: tLoginData.password)).thenAnswer((_) async => Right(tPlayer));

    final result = await usecase(tLoginData);
    expect(result, Right(tPlayer));
    verify(() => repository.loginWithEmail(
        email: tLoginData.email, password: tLoginData.password));
    verifyNoMoreInteractions(repository);
  });

  test('should return a InternetFailure when dont have internet conection',
      () async {
    when(() => repository.loginWithEmail(
            email: tLoginData.email, password: tLoginData.password))
        .thenAnswer((_) async => Left(InternetFailure()));

    final result = await usecase(tLoginData);
    expect(result, Left(InternetFailure()));
    verify(() => repository.loginWithEmail(
        email: tLoginData.email, password: tLoginData.password));
    verifyNoMoreInteractions(repository);
  });

  test(
      'should return a AuthServerFailure when app cant connect with auth server',
      () async {
    when(() => repository.loginWithEmail(
            email: tLoginData.email, password: tLoginData.password))
        .thenAnswer((_) async => Left(AuthServerFailure()));

    final result = await usecase(tLoginData);
    expect(result, Left(AuthServerFailure()));
    verify(() => repository.loginWithEmail(
        email: tLoginData.email, password: tLoginData.password));
    verifyNoMoreInteractions(repository);
  });

  test(
      'should return a WrongEmailOrPasswordFailure when user give wrong email or password',
      () async {
    when(() => repository.loginWithEmail(
            email: tLoginData.email, password: tLoginData.password))
        .thenAnswer((_) async => Left(WrongEmailOrPasswordFailure()));

    final result = await usecase(tLoginData);
    expect(result, Left(WrongEmailOrPasswordFailure()));
    verify(() => repository.loginWithEmail(
        email: tLoginData.email, password: tLoginData.password));
    verifyNoMoreInteractions(repository);
  });
}
