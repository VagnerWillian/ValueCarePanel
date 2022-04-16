import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/errors/users_errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

abstract class UsersRepository {
  Future<Either<UsersError, List<UserEntity>>> getAllUsers();
  Future<Either<UsersError, UserEntity>> createUser({required String name, required String email, required String phone, required int level});
  Future<Either<UsersError, bool>> activateUser({required String operatorId});
  Future<Either<UsersError, bool>> deactivateUser({required String operatorId});
  Future<Either<UsersError, bool>> deleteUser({required String operatorId});
}