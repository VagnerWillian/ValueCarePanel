import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/patient_details/ui/patient_details_page.dart';
import 'package:value_panel/app/modules/patient_details/ui/patient_details_store.dart';

class PatientsDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PatientDetailsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:id', child: (_, args) => PatientDetailsPage(idPatient: args.params['id'],)),
  ];
}
