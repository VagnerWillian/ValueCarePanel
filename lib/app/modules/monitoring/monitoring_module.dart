import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/domain/services/download_archive.service.dart';
import 'package:value_panel/app/modules/monitoring/domain/services/fetch_monitoring_from_interval_dates.service.dart';
import 'package:value_panel/app/modules/monitoring/domain/services/fetch_report_doc_src.service.dart';
import 'package:value_panel/app/modules/monitoring/domain/services/update_monitoring_item.service.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/download_archive.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_monitoring_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/update_monitoring_item.usecase.dart';
import 'package:value_panel/app/modules/monitoring/infra/repositories/asset.repository.dart';
import 'package:value_panel/app/modules/monitoring/ui/monitoring_page.dart';
import 'package:value_panel/app/modules/monitoring/ui/monitoring_store.dart';

class MonitoringModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MonitoringStore(
          fetchMonitoringDataFromIntervalDatesUseCase: i.get<FetchMonitoringDataFromIntervalDatesUseCase>(),
          fetchReportDocSrcUseCase: i.get<FetchReportDocSrcUseCase>(),
          downloadArchiveUseCase: i.get<DownloadArchiveUseCase>(),
          updateMonitoringItemUseCase: i.get<UpdateMonitoringItemUseCase>(),
        )),

    // UseCases
    Bind.lazySingleton((i) => FetchMonitoringFromIntervalDates(monitoringRepository: i.get<MonitoringRepository>())),
    Bind.lazySingleton((i) => FetchReportDocSrc(monitoringRepository: i.get<MonitoringRepository>())),
    Bind.lazySingleton((i) => UpdateMonitoringItem(i.get<MonitoringRepository>())),
    Bind.lazySingleton((i) => DownloadArchive()),

    // Repositories
    // Bind.lazySingleton((i) => JsonGeneratorRepository(i.get<CustomDio>())),
    Bind.lazySingleton((i) => AssetMonitoringRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MonitoringPage()),
  ];
}
