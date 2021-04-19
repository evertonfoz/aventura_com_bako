import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/core/usecase/usecase.dart';
import 'package:aventura_com_bako/features/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmailSignUpUsecase implements Usecase<bool, SignUpParams> {
  final IAuthRepository repository;

  EmailSignUpUsecase(this.repository);

  // U have give to usecase a list with 4 values, first [String] email and second [String] password
  // third [String] name, lastly [Image] of avatar
  @override
  Future<Either<Failure, bool>> call(SignUpParams signUpData) async {
    return await repository.signUpWithEmail(
        email: signUpData.email,
        password: signUpData.password,
        name: signUpData.name,
        avatar: signUpData.avatar);
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final Image avatar;

  SignUpParams(
      {@required this.email,
      @required this.password,
      @required this.name,
      @required this.avatar});
  @override
  List<Object> get props => [email, password, name, avatar];
}
