import 'dart:convert';
import 'dart:typed_data';

import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/core/usecase/usecase.dart';
import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:aventura_com_bako/features/login/domain/repositories/auth_repository.dart';
import 'package:aventura_com_bako/features/login/domain/usecases/google_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  GoogleLoginUsecase usecase;
  MockAuthRepository repository;
  setUp(() {
    repository = MockAuthRepository();
    usecase = GoogleLoginUsecase(repository);
  });

  NoParams tNoParams = NoParams();

  Uint8List tData = base64Decode("");

  final PlayerEntity tPlayer = PlayerEntity(
      id: "Y2qemClJulWVJqIEuup9sxOhgjv1",
      name: "GABRIEL ROCHA STABILE",
      email: "gabrielstabile@alunos.utfpr.edu.br",
      avatar: Image.memory(tData),
      token: "EXAMPLE_JWT_TOKEN");

  test('should get PlayerEntity from repository using Google Auth', () async {
    when(() => repository.loginWithGoogle())
        .thenAnswer((_) async => Right(tPlayer));

    final result = await usecase(tNoParams);
    expect(result, Right(tPlayer));
    verify(() => repository.loginWithGoogle());
    verifyNoMoreInteractions(repository);
  });

    test('should return a InternetFailure when dont have internet conection',
      () async {
    when(() => repository.loginWithGoogle())
        .thenAnswer((_) async => Left(InternetFailure()));

    final result = await usecase(tNoParams);
    expect(result, Left(InternetFailure()));
    verify(() => repository.loginWithGoogle());
    verifyNoMoreInteractions(repository);
  });

  test(
      'should return a AuthServerFailure when app cant connect with auth server',
      () async {
    when(() => repository.loginWithGoogle())
        .thenAnswer((_) async => Left(AuthServerFailure()));

    final result = await usecase(tNoParams);
    expect(result, Left(AuthServerFailure()));
    verify(() => repository.loginWithGoogle());
    verifyNoMoreInteractions(repository);
  });
}
