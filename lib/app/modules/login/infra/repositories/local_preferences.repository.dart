import 'package:either_dart/either.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../../../shared/core/preferences/local_preferences.dart';
import '../../../../utils/utils.dart';
import '../../domain/repositories/login.repository.dart';
import '../../errors/login.errors.dart';

class LocalLoginRepository implements LoginRepository{

  final LocalPreferences _localPreferences;
  LocalLoginRepository(this._localPreferences);

  @override
  Future<Either<LoginError, String>> saveToken({required String token}) async{
    try{
      String savedToken = await _localPreferences.setDataToString(key: TOKEN_USER_LOGGED_KEY, value: token);
      return Right(savedToken);
    }catch(e){
      return Left(UnknownLoginError(message: e.toString()));
    }
  }

  @override
  Future<Either<LoginError, String>> getToken({required String token}) async{
    try{
      String savedToken = await _localPreferences.getDataFromString(key: TOKEN_USER_LOGGED_KEY);
      return Right(savedToken);
    }catch(e){
      return Left(UnknownLoginError(message: e.toString()));
    }
  }

  @override
  Future<Either<LoginError, UserEntity>> getUser({required String email, required String pass}) {
    throw UnimplementedError();
  }

}