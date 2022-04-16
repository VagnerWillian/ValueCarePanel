import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/errors/users_errors.dart';

import '../usecases/deactivate_user.usecase.dart';

class DeactivateUserService implements DeactivateUserUseCase{

  final UsersRepository _usersRepository;
  DeactivateUserService(this._usersRepository);

  @override
  Future<Either<UsersError, bool>> call({required String operatorId})async{
    return _usersRepository.deactivateUser(operatorId: operatorId);
  }
}