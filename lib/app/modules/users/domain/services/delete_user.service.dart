import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/errors/users_errors.dart';

import '../usecases/deactivate_user.usecase.dart';
import '../usecases/delete_user.usecase.dart';

class DeleteUserService implements DeleteUserUseCase{

  final UsersRepository _usersRepository;
  DeleteUserService(this._usersRepository);

  @override
  Future<Either<UsersError, bool>> call({required String operatorId})async{
    return _usersRepository.deleteUser(operatorId: operatorId);
  }
}