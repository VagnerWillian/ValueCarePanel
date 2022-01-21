import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';

class FetchReportDocSrc implements FetchReportDocSrcUseCase{

  final MonitoringRepository monitoringRepository;
  FetchReportDocSrc({required this.monitoringRepository});

  @override
  Future<Either<MonitoringError, String>> call({required DateTime startDate, required DateTime endDate}) async{
      return await monitoringRepository.generateReportDoc(startDate: startDate, endDate: endDate);
  }
}