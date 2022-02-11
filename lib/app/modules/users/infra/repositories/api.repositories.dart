import 'package:either_dart/src/either.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/errors/scheduling.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

class ApiUsersRepository implements UsersRepository{
  @override
  Future<Either<UsersError, List<UserEntity>>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

}