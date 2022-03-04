import 'package:either_dart/either.dart';

import '../../errors/login.errors.dart';
import '../repositories/login.repository.dart';

class SaveTokenUseCase{

  final LoginRepository _loginRepository;
  SaveTokenUseCase(this._loginRepository);

  Future<Either<LoginError, String>> call({required String token})async{
    return await _loginRepository.saveToken(token: token);
  }
}