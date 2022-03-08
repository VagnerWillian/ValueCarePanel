import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/login/domain/repositories/login.repository.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../errors/login.errors.dart';

class SignInUseCase{

  final LoginRepository _loginRepository;
  SignInUseCase(this._loginRepository);

  Future<Either<LoginError, UserEntity>> call({required String email, required String pass})async{
    return await _loginRepository.getUserFromEmailAndPassword(email: email, pass: pass);
  }
}