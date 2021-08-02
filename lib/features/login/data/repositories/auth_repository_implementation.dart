import 'package:aventura_com_bako/core/errors/exceptions.dart';
import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/features/login/data/datasources/auth_datasource.dart';
import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:aventura_com_bako/features/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImplementation implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, PlayerEntity>> loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      var result = await datasource.loginWithEmail(email, password);
      return Right(result);
    } on ServerException {
      return Left(AuthServerFailure(
          message:
              'Não conseguimos nos conectar com o servidor de autenticação, tente novamente mais tarde ou envie-nos um email:'));
    } on InvalidCredentialsException {
      return Left(WrongEmailOrPasswordFailure(
          message: 'Seu email ou sua senha estão incorretos'));
    }
  }

  @override
  Future<Either<Failure, PlayerEntity>> loginWithGoogle() async {
    try {
      var result = await datasource.loginWithGoogle();
      return Right(result);
    } on ServerException {
      return Left(AuthServerFailure(
          message:
              'Não conseguimos nos conectar com o Google Auth, tente novamente mais tarde'));
    } on InvalidCredentialsException {
      return Left(WrongEmailOrPasswordFailure(
          message: 'Seu email ou sua senha estão incorretos' ''));
    }
  }

  @override
  Future<Either<Failure, bool>> signUpWithEmail(
      {@required String email,
      @required String password,
      @required String name,
      @required String avatar}) async {
    try {
      var result = await datasource.signUpWithEmail(email, password, name, avatar);
      return Right(result);
    } on ServerException {
      return Left(AuthServerFailure(
          message:
              'Não conseguimos nos conectar com o servidor de autenticação, tente novamente mais tarde ou envie-nos um email:'));
    } on InvalidCredentialsException {
      return Left(WrongEmailOrPasswordFailure(
          message: 'Seu email ou sua senha estão incorretos'));
    }
  }

  @override
  Future<Either<Failure, PlayerEntity>> getUserLogged() async {
    var result = await datasource.getUserLogged();
    if (result != null) {
      return Right(result);
    } else {
      return Left(UserNotLoggedFailure(message: 'Usuário não está logado'));
    }
  }
}
