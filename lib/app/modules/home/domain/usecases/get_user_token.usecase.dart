import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/home/domain/repositories/home.repository.dart';
import 'package:value_panel/app/modules/home/errors/home.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

class GetUseWithTokenUseCase{

  final HomeRepository _homeRepository;
  GetUseWithTokenUseCase(this._homeRepository);

  Future<Either<HomeError, UserEntity>> call({required String token}){
    return _homeRepository.getUserWithToken(token: token);
  }
}