import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../../../shared/core/infra/models/user.model.dart';
import '../../../../shared/custom_dio/custom.dio.dart';
import '../../domain/repositories/login.repository.dart';
import '../../errors/login.errors.dart';

class JsonGeneratorLoginRepository implements LoginRepository{

  final CustomDio _customDio;
  JsonGeneratorLoginRepository(this._customDio);

  final _header = {"Authorization":"Bearer ldhkns7svaq3wfb1faf6r4dfsa1bd8hua71d6lm6"};

  @override
  Future<Either<LoginError, UserEntity>> getUserFromEmailAndPassword({required String email, required String pass}) async{
    try{
      var response = await _customDio.client.post("https://api.json-generator.com/templates/VFcEHznX1fgb/data", options: Options(headers: _header), data: {"login":email, "senha":pass});
      UserEntity value = UserModel.fromJson(response.data);
      return Right(value);
    }on DioError catch(e){
      return Left(LoginRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(LoginRepositoryError(message: e.toString()));
    }
  }


  @override
  Future<Either<LoginError, String>> saveToken({required String token}) {
    throw UnimplementedError();
  }

}