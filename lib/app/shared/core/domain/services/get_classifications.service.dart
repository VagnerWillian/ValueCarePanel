import 'package:value_panel/app/shared/core/domain/repositories/repository.dart';

import '../entities/classification.entity.dart';
import '../usecases/get_classifications.usecase.dart';

class GetClassifications implements GetClassificationsUseCase{

  final CoreRepository _coreRepository;
  GetClassifications(this._coreRepository);

  @override
  Future<List<ClassificationEntity>> call(){
    return _coreRepository.getClassifications();
  }
}