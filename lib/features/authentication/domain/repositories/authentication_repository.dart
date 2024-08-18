
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/credentials_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, CredentialsEntity>> logIn();
  Future<Either<Failure, Unit>> logOut();
}
