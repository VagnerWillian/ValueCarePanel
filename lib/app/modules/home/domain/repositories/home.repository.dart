import 'package:either_dart/either.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../errors/home.errors.dart';

abstract class HomeRepository {
  Future<Either<HomeError, UserEntity>> getUserWithToken({required String token});
}