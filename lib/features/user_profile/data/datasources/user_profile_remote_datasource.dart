
import 'package:hive/hive.dart';

import '../../../../app/injection_container.dart';
import '../../../authentication/domain/entities/user_entity.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserEntity> getUserProfile();
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  @override
  Future<UserEntity> getUserProfile() async {
    final Map<String, dynamic>? map = locator<Box>().get('userMap');
    final UserEntity userEntity = UserEntity.fromMap(map!);
    return userEntity;
  }
}
