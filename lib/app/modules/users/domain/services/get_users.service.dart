import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/domain/usecases/get_users.usecase.dart';
import 'package:value_panel/app/modules/users/errors/scheduling.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

class GetUsers implements GetUsersUseCase{

  final UsersRepository _usersRepository;
  GetUsers(this._usersRepository);

  @override
  Future<Either<UsersError, List<UserEntity>>> call() async{
    return await _usersRepository.getAllUsers();
  }

}