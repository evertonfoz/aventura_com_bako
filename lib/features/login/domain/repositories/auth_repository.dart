import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class IAuthRepository {
  Future<Either<Failure, PlayerEntity>> loginWithEmail(
      {@required String email, @required String password});
  Future<Either<Failure, PlayerEntity>> loginWithGoogle();
  Future<Either<Failure, bool>> signUpWithEmail(
      {@required String email,
      @required String password,
      @required String name,
      @required Image avatar});
  Future<Either<Failure, PlayerEntity>> getUserLogged();
}
