import 'package:either_dart/either.dart';

import '../../errors/login.errors.dart';
import '../repositories/login.repository.dart';

class GetTokenUseCase{

  final LoginRepository _loginRepository;
  GetTokenUseCase(this._loginRepository);

  Future<Either<LoginError, String>> call({required String token})async{
    return await _loginRepository.getToken(token: token);
  }
}