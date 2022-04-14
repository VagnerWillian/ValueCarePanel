import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/home/home_module.dart';
import 'package:value_panel/app/modules/login/login_module.dart';
import 'package:value_panel/app/shared/core/domain/repositories/repository.dart';
import 'package:value_panel/app/shared/core/domain/services/get_classifications.service.dart';
import 'package:value_panel/app/shared/core/domain/services/get_specialties.service.dart';
import 'package:value_panel/app/shared/core/domain/usecases/get_classifications.usecase.dart';
import 'package:value_panel/app/shared/core/domain/usecases/get_especialties.usecase.dart';
import 'package:value_panel/app/shared/core/infra/repositories/api.repository.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/shared/core/preferences/local_preferences.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

import 'modules/patients/patients_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CustomDio(i.get<Dio>())),
    Bind.lazySingleton((i) => ConfigManager(i.get<LocalPreferences>(), i.get<GetClassificationsUseCase>(), i.get<GetSpecialtiesUseCase>())),
    Bind.lazySingleton((i) => LocalPreferences()),

    // DIO
    Bind.lazySingleton((i) => Dio()),

    // UseCases
    Bind.lazySingleton((i) => GetClassifications(i.get<CoreRepository>())),
    Bind.lazySingleton((i) => GetSpecialties(i.get<CoreRepository>())),

    // Repositories
    Bind.lazySingleton((i) => ApiCoreRepository(i.get<CustomDio>()))
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
