import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/home/errors/home.errors.dart';
import 'package:value_panel/app/modules/splash/domain/repositories/splash.repository.dart';
import 'package:value_panel/app/modules/splash/errors/splash.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../../../../shared/core/infra/models/user.model.dart';

class ApiSplashRepository implements SplashRepository{

  final CustomDio _customDio;
  ApiSplashRepository(this._customDio);

  @override
  Future<Either<SplashError, UserEntity>> getUserWithToken({required String token}) async {
    try{
      var response = await _customDio.client.get(getUserEP);
      UserEntity value = UserModel.fromJson(response.data['result']);
      return Right(value);
    }on DioError catch(e){
      return Left(SplashRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(SplashRepositoryError(message: e.toString()));
    }
  }

}