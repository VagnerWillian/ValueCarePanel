import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/fetch_scheduling_items_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';

class FetchSchedulingItemsFromIntervalDates implements FetchSchedulingDataFromIntervalDatesUseCase{

  final SchedulingRepository schedulingRepository;

  FetchSchedulingItemsFromIntervalDates({required this.schedulingRepository});

  @override
  Future<Either<SchedulingError, List<SchedulingDataEntity>>> call({required DateTime startDate, required DateTime endDate})async{
    return await schedulingRepository.fetchSchedulingItemsFromIntervalDates(startDate: startDate, endDate: endDate);
  }
}