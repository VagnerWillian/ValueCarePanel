import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/errors/scheduling.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

abstract class UsersRepository{
  Future<Either<UsersError, List<UserEntity>>> getAllUsers();
}