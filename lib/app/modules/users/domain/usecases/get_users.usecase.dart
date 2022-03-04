import 'package:either_dart/either.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../errors/users_errors.dart';
import '../repositories/repository.dart';

class GetUsersUseCase{

  final UsersRepository _usersRepository;
  GetUsersUseCase(this._usersRepository);

  Future<Either<UsersError, List<UserEntity>>> call() async{
    return await _usersRepository.getAllUsers();
  }

}