import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/errors/users_errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../../../../shared/core/infra/models/user.model.dart';

class ApiUsersRepository implements UsersRepository{

  final CustomDio _customDio;
  ApiUsersRepository(this._customDio);

  @override
  Future<Either<UsersError, List<UserEntity>>> getAllUsers() async  {
    try{
      var response = await _customDio.client.get(getUsersEP);
      List<UserEntity> users = (response.data['result'] as List).map((u) => UserModel.fromJson(u)).toList();
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
        'nome':name,
        'foto':"",
        'email':email,
        'telefone':phone,
        'nivel':level
      };
      var response = await _customDio.client.post(postUserEP, data: data);
      UserEntity value = UserModel.fromJson(response.data['result']);
      return Right(value);
    }on DioError catch(e){
    return Left(UsersRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
    return Left(UsersRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<UsersError, bool>> activateUser({required String operatorId}) async{
    try{
      var response = await _customDio.client.patch("/operador/$operatorId/ativar?code=$azureCode");
      return const Right(true);
    }on DioError catch(e){
      return Left(UsersRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(UsersRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<UsersError, bool>> deactivateUser({required String operatorId}) async{
    try{
      var response = await _customDio.client.patch("/operador/$operatorId/inativar?code=$azureCode");
      return const Right(true);
    }on DioError catch(e){
      return Left(UsersRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(UsersRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<UsersError, bool>> deleteUser({required String operatorId}) async{
    try{
      var response = await _customDio.client.patch("/operador/$operatorId/excluir?code=$azureCode");
      return const Right(true);
    }on DioError catch(e){
      return Left(UsersRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(UsersRepositoryError(message: e.toString()));
    }
  }

}