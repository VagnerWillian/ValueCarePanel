import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/scheduling/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';

class FetchReportDocSrc implements FetchReportDocSrcUseCase{

  final SchedulingRepository schedulingRepository;
  FetchReportDocSrc({required this.schedulingRepository});

  @override
  Future<Either<SchedulingError, String>> call({required DateTime startDate, required DateTime endDate}) async{
      return await schedulingRepository.generateReportDoc(startDate: startDate, endDate: endDate);
  }
}