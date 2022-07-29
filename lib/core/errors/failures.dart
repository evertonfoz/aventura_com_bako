import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

class InternetFailure extends Failure {
  const InternetFailure({required message}) : super(message);

  @override
  List<Object> get props => [];
}

class AuthServerFailure extends Failure {
  const AuthServerFailure({required message}) : super(message);

  @override
  List<Object> get props => [];
}

class WrongEmailOrPasswordFailure extends Failure {
  const WrongEmailOrPasswordFailure({required message}) : super(message);

  @override
  List<Object> get props => [];
}

class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure({required message}) : super(message);

  @override
  List<Object> get props => [];
}

class UserNotLoggedFailure extends Failure {
  const UserNotLoggedFailure({required message}) : super(message);

  @override
  List<Object> get props => [];
}
