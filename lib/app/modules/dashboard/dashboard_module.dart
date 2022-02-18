import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/domain/services/fetch_monitoring_from_interval_dates.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/services/get_comparison_data.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/services/update_monitoring_item.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/get_comparison_data.usecase.dart';
import 'package:value_panel/app/modules/dashboard/infra/repositories/json_generator.repository.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_page.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_store.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore(
        i.get<GetComparisonGroupDataUseCase>(),
        i.get<FetchMonitoringFromIntervalDates>(),
        i.get<UpdateMonitoringItem>(),
    )),

    Bind.lazySingleton((i) => GetComparisonGroupData(i.get<JsonGeneratorDashboardRepository>())),
    Bind.lazySingleton((i) => FetchMonitoringFromIntervalDates(dashBoardRepository: i.get<DashboardRepository>())),
    Bind.lazySingleton((i) => UpdateMonitoringItem(dasboardRepository: i.get<DashboardRepository>())),

    Bind.lazySingleton((i) => JsonGeneratorDashboardRepository(i.get<CustomDio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const DashboardPage()),
  ];
}
