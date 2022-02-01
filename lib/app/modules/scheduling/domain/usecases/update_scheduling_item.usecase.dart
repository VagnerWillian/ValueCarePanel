import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';

abstract class UpdateSchedulingItemUseCase{
  Future<Either<SchedulingError, bool>> call({required SchedulingDataEntity schedulingDataEntity});
}