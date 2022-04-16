import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/errors/users_errors.dart';

abstract class DeactivateUserUseCase{
  Future<Either<UsersError, bool>> call({required String operatorId});
}