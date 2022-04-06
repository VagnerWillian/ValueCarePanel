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
      await Future.delayed(const Duration(seconds: 2));
      var response = await _customDio.client.get(getUsuarioEP);
      List<UserEntity> users = (response.data as List).map((u) => UserModel.fromJson(u)).toList();
      return Right(users);
    }on DioError catch(e){
      return Left(UsersRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(UsersRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<UsersError, UserEntity>> createUser({required String name, required String email, required String phone, required int level}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

}