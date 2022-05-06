import 'package:either_dart/either.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/app_store.dart';
import 'package:value_panel/app/shared/core/domain/entities/hospital.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../errors/home.errors.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  // UseCases
  final ConfigManager _configManager;
  final AppStore appStore;

  HomeStoreBase(this._configManager, this.appStore);

  late HospitalEntity selectedHospital;

  //Observables

  @observable
  late String actuallyRoute = Modular.to.path;

  //Actions

  @action
  void _setRoute(String value)=>actuallyRoute=value;

  //Voids

  void navigateTo(String path){
    Modular.to.navigate(path);
    _setRoute(path);
  }
}