import 'package:either_dart/either.dart';
import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../domain/repositories/login.repository.dart';
import '../../errors/login.errors.dart';

class AssetLoginRepository implements LoginRepository{
  @override
  Future<Either<LoginError, UserEntity>> getUser({required String email, required String pass}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<LoginError, String>> getToken({required String token}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<LoginError, String>> saveToken({required String token}) {
    throw UnimplementedError();
  }

}