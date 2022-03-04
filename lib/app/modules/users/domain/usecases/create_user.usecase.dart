import 'package:either_dart/either.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../errors/users_errors.dart';
import '../repositories/repository.dart';

class CreateUserUseCase{

  final UsersRepository _usersRepository;
  CreateUserUseCase(this._usersRepository);

  Future<Either<UsersError, UserEntity>> call({required String name, required String email, required String phone, required int level})async{
    return await _usersRepository.createUser(name: name, email: email, phone: phone, level: level);
  }
}