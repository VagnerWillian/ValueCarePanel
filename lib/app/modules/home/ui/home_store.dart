import 'package:either_dart/either.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/home/domain/usecases/get_user_token.usecase.dart';
import 'package:value_panel/app/shared/core/domain/entities/hospital.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';

import '../errors/home.errors.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  // UseCases
  final GetUseWithTokenUseCase _getUserWithTokenUseCase;
  final ConfigManager _configManager;

  HomeStoreBase(this._getUserWithTokenUseCase, this._configManager);

  late HospitalEntity selectedHospital;

  //Observables

  @observable
  UserEntity? userLogged;

  @observable
  late String actuallyRoute = Modular.to.path;

  //Actions

  @action
  void _setRoute(String value)=>actuallyRoute=value;

  @action
  setUserLogged(UserEntity value)=>userLogged=value;

  //Voids

  void navigateTo(String path){
    Modular.to.navigate(path);
    _setRoute(path);
  }

  Future loadUser({required Function onError})async{
    Either<HomeError, UserEntity> result = await _getUserWithTokenUseCase(token: _configManager.tokenUserLogged);
    result.fold((HomeError failure) {
      onError(failure);
      return failure;
    }, (UserEntity value) async{
      setUserLogged(value);
      // navigateTo(DASHBOARD_ROUTE);
      return value;
    });
  }

}