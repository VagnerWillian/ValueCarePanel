import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/errors/scheduling.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

abstract class GetUsersUseCase{
  Future<Either<UsersError, List<UserEntity>>> call();
}