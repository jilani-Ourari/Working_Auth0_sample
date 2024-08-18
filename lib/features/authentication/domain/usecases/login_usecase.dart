
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/credentials_entity.dart';
import '../repositories/authentication_repository.dart';

class LogInUseCase {
  final AuthenticationRepository repository;

  LogInUseCase(this.repository);

  Future<Either<Failure, CredentialsEntity>> call() async {
    return await repository.logIn();
  }
}
