import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/errors/scheduling.errors.dart';
import 'package:value_panel/app/modules/users/infra/models/user.model.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class JsonGeneratorRepository implements UsersRepository{

  final CustomDio _customDio;
  final _header = {"Authorization":"Bearer ldhkns7svaq3wfb1faf6r4dfsa1bd8hua71d6lm6"};

  JsonGeneratorRepository(this._customDio);

  @override
  Future<Either<UsersError, List<UserEntity>>> getAllUsers() async{
    try{
      await Future.delayed(const Duration(seconds: 2));
      var response = await _customDio.client.post("https://api.json-generator.com/templates/dGfUm_9fGjZK/data", options: Options(headers: _header));
      List<UserEntity> users = (response.data as List).map((u) => UserModel.fromJson(u)).toList();
      return Right(users);
    }on DioError catch(e){
      return Left(UsersRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(UsersRepositoryError(message: e.toString()));
    }
  }

}