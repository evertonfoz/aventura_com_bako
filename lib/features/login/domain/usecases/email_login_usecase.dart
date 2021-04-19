import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/core/usecase/usecase.dart';
import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:aventura_com_bako/features/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class EmailLoginUsecase implements Usecase<PlayerEntity, SignInParams> {
  final IAuthRepository repository;

  EmailLoginUsecase(this.repository);

  @override
  Future<Either<Failure, PlayerEntity>> call(SignInParams params) async {
    if (GetUtils.isEmail(params.email)) {
      return await repository.loginWithEmail(
          email: params.email, password: params.password);
    } else {
      return Left(WrongEmailOrPasswordFailure(message: 'Seu e-mail ou senha estão incorretos.'));
    }
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  SignInParams({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
