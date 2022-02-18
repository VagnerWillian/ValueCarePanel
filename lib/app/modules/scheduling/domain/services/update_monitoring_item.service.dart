import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/update_scheduling_item.usecase.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';

class UpdateSchedulingItem implements UpdateSchedulingItemUseCase{

  final SchedulingRepository schedulingRepository;

  UpdateSchedulingItem(this.schedulingRepository);

  @override
  Future<Either<SchedulingError, bool>> call({required SchedulingDataEntity schedulingDataEntity})async{
    return await schedulingRepository.updateSchedulingItem(schedulingDataEntity: schedulingDataEntity);
  }
}