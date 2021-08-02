import 'package:aventura_com_bako/core/errors/failures.dart';
import 'package:aventura_com_bako/core/usecase/usecase.dart';
import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:aventura_com_bako/features/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GoogleLoginUsecase implements Usecase<PlayerEntity, NoParams> {
  IAuthRepository repository;
  GoogleLoginUsecase(this.repository);

  @override
  Future<Either<Failure, PlayerEntity>> call(NoParams noParams) async {
    return await repository.loginWithGoogle();
  }
}
