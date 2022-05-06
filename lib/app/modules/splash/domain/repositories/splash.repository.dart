import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/splash/errors/splash.errors.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';

abstract class SplashRepository {
  Future<Either<SplashError, UserEntity>> getUserWithToken({required String token});
}