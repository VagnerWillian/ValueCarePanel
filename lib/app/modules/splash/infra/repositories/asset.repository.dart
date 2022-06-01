import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:value_panel/app/modules/splash/domain/repositories/splash.repository.dart';
import 'package:value_panel/app/modules/splash/errors/splash.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/core/infra/models/user.model.dart';

class AssetSplashRepository implements SplashRepository{

  @override
  Future<Either<SplashError, UserEntity>> getUserWithToken({required String token}) async {
    await Future.delayed(const Duration(seconds: 1));
    String data = await rootBundle.loadString('assets/static_jsons/logged_user.json');
    var jsonResult = json.decode(data);
    return Right(UserModel.fromJson(jsonResult));
  }

}