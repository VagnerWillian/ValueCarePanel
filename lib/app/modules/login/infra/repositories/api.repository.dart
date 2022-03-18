import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../../../shared/core/infra/models/user.model.dart';
import '../../../../shared/custom_dio/custom.dio.dart';
import '../../domain/repositories/login.repository.dart';
import '../../errors/login.errors.dart';

class ApiLoginRepository implements LoginRepository{

  final CustomDio _customDio;
  ApiLoginRepository(this._customDio);

  @override
  Future<Either<LoginError, UserEntity>> getUserFromEmailAndPassword({required String email, required String pass}) async{
    try{
      var response = await _customDio.client.post("$baseUrl/auth?code=$azureCode", data: {"login":email, "senha":pass});
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