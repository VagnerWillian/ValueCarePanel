import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/login/login_module.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/shared/utils.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CustomDio(i.get<Dio>())),

    // DIO
    Bind.lazySingleton((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(LOGIN_ROUTE, module: LoginModule()),
  ];

}