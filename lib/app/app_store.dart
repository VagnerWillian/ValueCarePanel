import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/utils/utils.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;
abstract class _AppStoreBase with Store {

  final ConfigManager _configManager;

  _AppStoreBase(this._configManager);

  //Observables

  @observable
  UserEntity? loggedUser;

  //Actions

  @action
  setUserLogged(UserEntity? value)=>loggedUser = value;

  Future signOut()async{
    await _configManager.setHasTokenUserLogged("");
    setUserLogged(null);
    Modular.to.pushNamedAndRemoveUntil(LOGIN_ROUTE, (_) => false);
  }

}