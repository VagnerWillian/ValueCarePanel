import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/dashboard/dashboard_module.dart';
import 'package:value_panel/app/modules/home/domain/repositories/home.repository.dart';
import 'package:value_panel/app/modules/home/infra/repositories/json_generator.repository.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/modules/monitoring/monitoring_module.dart';
import 'package:value_panel/app/modules/scheduling/scheduling_module.dart';
import 'package:value_panel/app/modules/users/users_module.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

import 'domain/usecases/get_user_token.usecase.dart';
import 'ui/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
     //Stores
     Bind.lazySingleton((i) => HomeStore(
       i.get<GetUseWithTokenUseCase>(),
       i.get<ConfigManager>()
     )),

    //UseCases
    Bind.lazySingleton((i) => GetUseWithTokenUseCase(i.get<HomeRepository>())),

    //Repositories
    Bind.lazySingleton((i) => JsonGeneratorHomeRepository(i.get<CustomDio>()))
 ];

 @override
 final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage(),
     children: [
     ModuleRoute(DASHBOARD_ROUTE, module: DashboardModule(), transition: TransitionType.fadeIn),
     ModuleRoute(MONITORING_ROUTE, module: MonitoringModule(), transition: TransitionType.fadeIn),
     ModuleRoute(SCHEDULING_ROUTE, module: SchedulingModule(), transition: TransitionType.fadeIn),
     ModuleRoute(USERS_ROUTE, module: UsersModule(), transition: TransitionType.fadeIn),
   ]),
 ];
}