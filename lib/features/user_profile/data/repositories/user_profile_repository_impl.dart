import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../authentication/domain/entities/user_entity.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../datasources/user_profile_remote_datasource.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource userProfileRemoteDataSource;

  UserProfileRepositoryImpl({required this.userProfileRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUserProfile() async {
    try {
      final UserEntity userEntity =
          await userProfileRemoteDataSource.getUserProfile();
      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
