import 'package:value_panel/app/modules/dashboard/domain/services/get_comparison_data.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/get_comparison_data.usecase.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_page.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/dashboard/infra/repositories/json_generator.repository.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore(i.get<GetComparisonGroupDataUseCase>())),

    Bind.lazySingleton((i) => GetComparisonGroupData(i.get<JsonGeneratorDashboardRepository>())),

    Bind.lazySingleton((i) => JsonGeneratorDashboardRepository(i.get<CustomDio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const DashboardPage()),
  ];
}
