import 'package:either_dart/either.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../errors/login.errors.dart';

abstract class LoginRepository{
  Future<Either<LoginError, UserEntity>> getUser({required String email, required String pass});
  Future<Either<LoginError, String>> saveToken({required String token});
  Future<Either<LoginError, String>> getToken({required String token});
}
