import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/monitoring/domain/application/download_archive.application.dart';
import 'package:value_panel/app/modules/monitoring/domain/application/fetch_employees_from_interval_dates.application.dart';
import 'package:value_panel/app/modules/monitoring/domain/application/fetch_report_doc_src.application.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/download_archive.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_employees_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/monitoring/infra/repositories/api.repository.dart';
import 'package:value_panel/app/modules/monitoring/ui/monitoring_page.dart';
import 'package:value_panel/app/modules/monitoring/ui/monitoring_store.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class MonitoringModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MonitoringStore(
        fetchMonitoringDataFromIntervalDatesUseCase: i.get<FetchMonitoringDataFromIntervalDatesUseCase>(),
        fetchReportDocSrcUseCase: i.get<FetchReportDocSrcUseCase>(),
        downloadArchiveUseCase: i.get<DownloadArchiveUseCase>()
    )),

    // UseCases
    Bind.lazySingleton((i) => FetchEmployeesFromIntervalDates(monitoringRepository: i.get<MonitoringRepository>())),
    Bind.lazySingleton((i) => FetchReportDocSrc(monitoringRepository: i.get<MonitoringRepository>())),
    Bind.lazySingleton((i) => DownloadArchive()),

    // Repositories
    // Bind.lazySingleton((i) => StaticRepository()),
    Bind.lazySingleton((i) => APIRepository(i.get<CustomDio>())),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MonitoringPage()),
  ];
}
