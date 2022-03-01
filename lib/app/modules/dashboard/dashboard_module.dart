import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/domain/services/download_archive.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/services/fetch_monitoring_from_interval_dates.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/services/fetch_report_doc_src.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/services/get_comparison_data.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/services/update_monitoring_item.service.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/download_archive.usecase.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/fetch_monitoring_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/get_comparison_data.usecase.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/update_monitoring_item.usecase.dart';
import 'package:value_panel/app/modules/dashboard/infra/repositories/asset.repository.dart';
import 'package:value_panel/app/modules/dashboard/infra/repositories/json_generator.repository.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_page.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_store.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore(
        getComparisonGroupDataUseCase: i.get<GetComparisonGroupDataUseCase>(),
        fetchMonitoringDataFromIntervalDatesUseCase: i.get<FetchMonitoringDataFromIntervalDatesUseCase>(),
        updateMonitoringItemUseCase: i.get<UpdateMonitoringItemUseCase>(),
        fetchReportDocSrc: i.get<FetchReportDocSrcUseCase>(),
        downloadArchive: i.get<DownloadArchiveUseCase>(),
    )),

    // UseCases
    Bind.lazySingleton((i) => GetComparisonGroupData(i.get<DashboardRepository>())),
    Bind.lazySingleton((i) => FetchMonitoringFromIntervalDates(dashBoardRepository: i.get<DashboardRepository>())),
    Bind.lazySingleton((i) => UpdateMonitoringItem(dasboardRepository: i.get<DashboardRepository>())),
    Bind.lazySingleton((i) => FetchReportDocSrc(dashboardRepository: i.get<DashboardRepository>())),
    Bind.lazySingleton((i) => DownloadArchive()),

    // Repositories
    // Bind.lazySingleton((i) => JsonGeneratorDashboardRepository(i.get<CustomDio>())),
    Bind.lazySingleton((i) => AssetDashBoardRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const DashboardPage()),
  ];
}
