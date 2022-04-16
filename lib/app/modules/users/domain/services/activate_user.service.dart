import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/errors/users_errors.dart';

import '../usecases/activate_user.usecase.dart';

class ActivateUserService implements ActivateUserUseCase{

  final UsersRepository _usersRepository;
  ActivateUserService(this._usersRepository);

  @override
  Future<Either<UsersError, bool>> call({required String operatorId})async{
    return _usersRepository.activateUser(operatorId: operatorId);
  }
}