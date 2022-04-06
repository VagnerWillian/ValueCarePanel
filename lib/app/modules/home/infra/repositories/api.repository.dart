import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:value_panel/app/modules/home/domain/repositories/home.repository.dart';
import 'package:value_panel/app/modules/home/errors/home.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../../../../shared/core/infra/models/user.model.dart';

class ApiHomeRepository implements HomeRepository{

  final CustomDio _customDio;
  ApiHomeRepository(this._customDio);

  @override
  Future<Either<HomeError, UserEntity>> getUserWithToken({required String token}) async {
    try{
      var response = await _customDio.client.get(getUsuarioEP);
      UserEntity value = UserModel.fromJson(response.data['result']);
      return Right(value);
    }on DioError catch(e){
      return Left(HomeRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(HomeRepositoryError(message: e.toString()));
    }
  }

}