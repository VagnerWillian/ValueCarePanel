import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/splash/domain/repositories/splash.repository.dart';
import 'package:value_panel/app/modules/splash/errors/splash.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

class GetUseWithTokenUseCase{

  final SplashRepository _homeRepository;
  GetUseWithTokenUseCase(this._homeRepository);

  Future<Either<SplashError, UserEntity>> call({required String token}){
    return _homeRepository.getUserWithToken(token: token);
  }
}