import 'package:value_panel/app/modules/configurations/ui/configurations_page.dart';
import 'package:value_panel/app/modules/configurations/ui/configurations_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfigurationsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ConfigurationsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ConfigurationsPage()),
  ];
}
