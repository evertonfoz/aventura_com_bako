import 'dart:convert';
import 'dart:typed_data';

import 'package:aventura_com_bako/core/errors/exceptions.dart';
import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/features/login/data/datasources/auth_datasource.dart';
import 'package:aventura_com_bako/features/login/data/model/player_model.dart';
import 'package:aventura_com_bako/features/login/data/repositories/auth_repository_implementation.dart';
import 'package:aventura_com_bako/features/login/domain/usecases/email_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIAuthDatasource extends Mock implements IAuthDatasource {}

void main() {
  AuthRepositoryImplementation repository;
  MockIAuthDatasource datasource;

  setUp(() {
    datasource = MockIAuthDatasource();
    repository = AuthRepositoryImplementation(datasource);
  });

  SignInParams tLoginData = SignInParams(
      email: 'gabrielstabile@alunos.utfpr.edu.br', password: 'Mocked@Password');

  Uint8List tData = base64Decode("");

  final tPlayerModel = PlayerModel(
      id: "Y2qemClJulWVJqIEuup9sxOhgjv1",
      name: "GABRIEL ROCHA STABILE",
      email: "gabrielstabile@alunos.utfpr.edu.br",
      avatar: Image.memory(tData),
      token: "EXAMPLE_JWT_TOKEN");

  test('should return a PlayerModel when calls login with email on datasource',
      () async {
    //Arrange
    when(() => datasource.loginWithEmail(tLoginData.email, tLoginData.password))
        .thenAnswer((_) async => tPlayerModel);

    // Act
    final result = await repository.loginWithEmail(email: tLoginData.email, password: tLoginData.password);

    // Assert
    expect(result, Right(tPlayerModel));
    verify(() => datasource.loginWithEmail(tLoginData.email, tLoginData.password));
  });

  test(
      'should return an ServerException when calls datasource and it dont answer',
      () async {
    //Arrange
    when(() => datasource.loginWithEmail(tLoginData.email, tLoginData.password))
        .thenThrow(ServerException());

    //Act
    final result = await repository.loginWithEmail(email: tLoginData.email, password: tLoginData.password);

    //Arrange
    expect(result, Left(AuthServerFailure()));
    verify(() => datasource.loginWithEmail(tLoginData.email, tLoginData.password));
  });

  test(
      'should return an InvalidCredentialsException when calls datasource and user didnt gave the right email or password',
      () async {
    //Arrange
    when(() => datasource.loginWithEmail(tLoginData.email, tLoginData.password))
        .thenThrow(InvalidCredentialsException());

    //Act
    final result = await repository.loginWithEmail(email: tLoginData.email, password: tLoginData.password);

    //Arrange
    expect(result, Left(WrongEmailOrPasswordFailure()));
    verify(() => datasource.loginWithEmail(tLoginData.email, tLoginData.password));
  });
}
