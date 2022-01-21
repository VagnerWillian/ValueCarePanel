import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/dashboard/dashboard_module.dart';
import 'package:value_panel/app/modules/monitoring/monitoring_module.dart';
import '../home/ui/home_store.dart';

import 'ui/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => HomeStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage(), children: [
     ModuleRoute('/dashboard', module: DashboardModule(), transition: TransitionType.fadeIn),
     ModuleRoute('/monitoramento', module: MonitoringModule(), transition: TransitionType.fadeIn),
   ]),
 ];
}