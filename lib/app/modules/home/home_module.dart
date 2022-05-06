import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/app_store.dart';
import 'package:value_panel/app/modules/configurations/configurations_module.dart';
import 'package:value_panel/app/modules/dashboard/dashboard_module.dart';
import 'package:value_panel/app/modules/home/ui/home_page.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/modules/monitoring/monitoring_module.dart';
import 'package:value_panel/app/modules/patients/patients_module.dart';
import 'package:value_panel/app/modules/scheduling/scheduling_module.dart';
import 'package:value_panel/app/modules/users/users_module.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../patient_details/patients_details_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
     //Stores
     Bind.lazySingleton((i) => HomeStore(
       i.get<ConfigManager>(),
       i.get<AppStore>()
     )),
 ];

 @override
 final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage(),
     children: [
       ModuleRoute(DASHBOARD_ROUTE, module: DashboardModule(), transition: TransitionType.fadeIn),
       ModuleRoute(MONITORING_ROUTE, module: MonitoringModule(), transition: TransitionType.fadeIn),
       ModuleRoute(SCHEDULING_ROUTE, module: SchedulingModule(), transition: TransitionType.fadeIn),
       ModuleRoute(USERS_ROUTE, module: UsersModule(), transition: TransitionType.fadeIn),
       ModuleRoute(PATIENTS_ROUTE, module: PatientsModule(), transition: TransitionType.fadeIn),
       ModuleRoute(PATIENT_DETAILS_ROUTE, module: PatientsDetailsModule(), transition: TransitionType.fadeIn),
       ModuleRoute(CONFIG_ROUTE, module: ConfigurationsModule(), transition: TransitionType.fadeIn),
     ]),
 ];
}