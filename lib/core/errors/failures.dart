import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);
}

class InternetFailure extends Failure {
  final String message;

  InternetFailure({@required this.message}) : super(message);
  @override
  List<Object> get props => [];
}

class AuthServerFailure extends Failure {
  final String message;

  AuthServerFailure({@required this.message}) : super(message);

  @override
  List<Object> get props => [];
}

class WrongEmailOrPasswordFailure extends Failure {
  final String message;

  WrongEmailOrPasswordFailure({@required this.message}) : super(message);

  @override
  List<Object> get props => [];
}

class EmailAlreadyInUseFailure extends Failure {
  final String message;

  EmailAlreadyInUseFailure({@required this.message}) : super(message);

  @override
  List<Object> get props => [];
}

class UserNotLoggedFailure extends Failure {
  final String message;

  UserNotLoggedFailure({@required this.message}) : super(message);

  @override
  List<Object> get props => [];
}
