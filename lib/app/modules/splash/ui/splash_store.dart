import 'package:either_dart/either.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/app_store.dart';
import 'package:value_panel/app/modules/splash/domain/usecases/get_user_token.usecase.dart';
import 'package:value_panel/app/modules/splash/errors/splash.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';

import '../../../utils/utils.dart';


part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;
abstract class _SplashStoreBase with Store {

  final ConfigManager _configManager;
  final AppStore _appStore;
  final GetUseWithTokenUseCase _getUserWithTokenUseCase;

  _SplashStoreBase(this._configManager, this._getUserWithTokenUseCase,this._appStore);

  Future initialize({required Function onError})async{
    try{
      await _configManager.initialize();
      if(_configManager.tokenUserLogged.isEmpty){
        Modular.to.pushNamedAndRemoveUntil(LOGIN_ROUTE, (route) => false);
      }else{
        await _configManager.remoteConfigOfRemoteData();
        await loadUser(onError: onError, token: _configManager.tokenUserLogged);
      }
    }catch(err){

    }
  }

  Future loadUser({required Function onError, required String token})async{
    Either<SplashError, UserEntity> result = await _getUserWithTokenUseCase(token: token);
    await result.fold((SplashError failure) async{
      await onError(failure);
      _appStore.setUserLogged(null);
      Modular.to.navigate(LOGIN_ROUTE);
      return failure;
    }, (UserEntity value) async{
      _appStore.setUserLogged(value);
      Modular.to.navigate(DASHBOARD_ROUTE);
      return value;
    });
  }

}