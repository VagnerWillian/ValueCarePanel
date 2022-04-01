import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/get_score_graphic_of_dates.usecase.dart';
import 'package:value_panel/app/modules/patient_details/infra/repositories/json_generator.repository.dart';
import 'package:value_panel/app/modules/patient_details/ui/patient_details_page.dart';
import 'package:value_panel/app/modules/patient_details/ui/patient_details_store.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

import 'domain/services/get_score_graphic_of_dates.service.dart';

class PatientsDetailsModule extends Module {

  @override
  final List<Bind> binds = [

    //Stores
    Bind.lazySingleton((i) => PatientDetailsStore(i.get<GetScoreGraphicOfDatesUseCase>())),

    //UseCases
    Bind.lazySingleton((i) => GetScoreGraphicOfDates(i.get<PatientDetailsRepository>())),

    //Repositories
    Bind.lazySingleton((i) => JsonGeneratorPatientDetailsRepository(i.get<CustomDio>())),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:id', child: (_, args) => PatientDetailsPage(idPatient: args.params['id'],)),
  ];
}
