import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../authentication/domain/entities/user_entity.dart';
import '../repositories/user_profile_repository.dart';

class GetUserProfileUseCase {
  final UserProfileRepository repository;

  const GetUserProfileUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call() {
    return repository.getUserProfile();
  }
}
