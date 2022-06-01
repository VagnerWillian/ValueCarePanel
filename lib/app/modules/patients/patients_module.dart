import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/patients/ui/patients_page.dart';
import 'package:value_panel/app/modules/patients/ui/patients_store.dart';

class PatientsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PatientsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PatientsPage(), children: []),
  ];
}
