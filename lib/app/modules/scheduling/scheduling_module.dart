import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/scheduling/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/scheduling/domain/services/download_archive.service.dart';
import 'package:value_panel/app/modules/scheduling/domain/services/fetch_report_doc_src.service.dart';
import 'package:value_panel/app/modules/scheduling/domain/services/fetch_scheduling_items_from_interval_dates.service.dart';
import 'package:value_panel/app/modules/scheduling/domain/services/update_monitoring_item.service.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/download_archive.usecase.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/fetch_scheduling_items_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/update_scheduling_item.usecase.dart';
import 'package:value_panel/app/modules/scheduling/infra/repositories/asset.repository.dart';
import 'package:value_panel/app/modules/scheduling/infra/repositories/json_generator.repository.dart';
import 'package:value_panel/app/modules/scheduling/ui/scheduling_page.dart';
import 'package:value_panel/app/modules/scheduling/ui/scheduling_store.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class SchedulingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SchedulingStore(
        fetchSchedulingDataFromIntervalDatesUseCase: i.get<FetchSchedulingDataFromIntervalDatesUseCase>(),
        fetchReportDocSrcUseCase: i.get<FetchReportDocSrcUseCase>(),
        downloadArchiveUseCase: i.get<DownloadArchiveUseCase>(),
        updateSchedulingItemUseCase: i.get<UpdateSchedulingItemUseCase>(),
    )),

    // UseCases
    Bind.lazySingleton((i) => FetchSchedulingItemsFromIntervalDates(schedulingRepository: i.get<SchedulingRepository>())),
    Bind.lazySingleton((i) => FetchReportDocSrc(schedulingRepository: i.get<SchedulingRepository>())),
    Bind.lazySingleton((i) => UpdateSchedulingItem(i.get<SchedulingRepository>())),
    Bind.lazySingleton((i) => DownloadArchive()),

    // Repositories
    // Bind.lazySingleton((i) => JsonGeneratorRepository(i.get<CustomDio>())),
    Bind.lazySingleton((i) => AssetSchedulingRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SchedulingPage()),
  ];
}
