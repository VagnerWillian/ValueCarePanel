import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:value_panel/app/modules/home/domain/repositories/home.repository.dart';
import 'package:value_panel/app/modules/home/errors/home.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

import '../../../../shared/core/infra/models/user.model.dart';

class JsonGeneratorHomeRepository implements HomeRepository{

  final CustomDio _customDio;
  JsonGeneratorHomeRepository(this._customDio);

  final _header = {"Authorization":"Bearer lib361fjoaiy06cib24z0fub3531yhpzxv214iro"};

  @override
  Future<Either<HomeError, UserEntity>> getUserWithToken({required String token}) async {
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/VFcEHznX1fgb/data", options: Options(headers: _header));
      UserEntity value = UserModel.fromJson(response.data);
      return Right(value);
    }on DioError catch(e){
      return Left(HomeRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(HomeRepositoryError(message: e.toString()));
    }
  }

}