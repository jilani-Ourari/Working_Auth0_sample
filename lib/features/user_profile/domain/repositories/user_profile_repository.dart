import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../authentication/domain/entities/user_entity.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserEntity>> getUserProfile();
}
