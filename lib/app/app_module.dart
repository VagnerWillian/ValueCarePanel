import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/home/home_module.dart';
import 'package:value_panel/app/modules/login/login_module.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/shared/core/preferences/local_preferences.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

import 'modules/patients/patients_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CustomDio(i.get<Dio>())),
    Bind.lazySingleton((i) => ConfigManager(i.get<LocalPreferences>())),
    Bind.lazySingleton((i) => LocalPreferences()),

    // DIO
    Bind.lazySingleton((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(LOGIN_ROUTE, module: LoginModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule(), guards: [AuthGuard()]),
  ];

}

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: LOGIN_ROUTE);

  @override
  Future<bool> canActivate(String path, ModularRoute route) async{
    final ConfigManager _configManager = Modular.get();
    await _configManager.initialize();
    if(_configManager.tokenUserLogged.isEmpty){
      Modular.to.pushReplacementNamed(LOGIN_ROUTE);
    }
    return true;
  }
}
