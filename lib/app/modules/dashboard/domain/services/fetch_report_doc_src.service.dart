import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

class FetchReportDocSrc implements FetchReportDocSrcUseCase{

  final DashboardRepository dashboardRepository;
  FetchReportDocSrc({required this.dashboardRepository});

  @override
  Future<Either<DashboardError, String>> call({required DateTime startDate, required DateTime endDate}) async{
      return await dashboardRepository.generateReportDoc(startDate: startDate, endDate: endDate);
  }
}