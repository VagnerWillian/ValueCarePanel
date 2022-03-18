import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../../../shared/core/infra/models/user.model.dart';
import '../../../../shared/custom_dio/custom.dio.dart';
import '../../domain/repositories/repository.dart';
import '../../errors/users_errors.dart';

class JsonGeneratorRepository implements UsersRepository{

  final CustomDio _customDio;
  final _header = {"Authorization":"Bearer lib361fjoaiy06cib24z0fub3531yhpzxv214iro"};

  JsonGeneratorRepository(this._customDio);

  @override
  Future<Either<UsersError, List<UserEntity>>> getAllUsers() async{
    try{
      await Future.delayed(const Duration(seconds: 2));
      var response = await _customDio.client.post("https://api.json-generator.com/templates/IdThcNaNoWfV/data", options: Options(headers: _header));
      List<UserEntity> users = (response.data as List).map((u) => UserModel.fromJson(u)).toList();
      return Right(users);
    }on DioError catch(e){
      return Left(UsersRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(UsersRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<UsersError, UserEntity>> createUser({required String name, required String email, required String phone, required int level}) async{
    try{
      Map data = {
        'name':name,
        'email':email,
        'phone':phone,
        'level':level
      };
      var response = await _customDio.client.post("https://api.json-generator.com/templates/VFcEHznX1fgb/data", options: Options(headers: _header), data: data);
      UserEntity value = UserModel.fromJson(response.data);
      return Right(value);
    }on DioError catch(e){
      return Left(UsersRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(UsersRepositoryError(message: e.toString()));
    }
  }

}