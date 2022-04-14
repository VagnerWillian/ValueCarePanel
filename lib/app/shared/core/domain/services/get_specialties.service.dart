import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/core/domain/repositories/repository.dart';
import 'package:value_panel/app/shared/core/domain/usecases/get_especialties.usecase.dart';

class GetSpecialties implements GetSpecialtiesUseCase{

  final CoreRepository _coreRepository;
  GetSpecialties(this._coreRepository);

  @override
  Future<List<SpecialtyEntity>> call() async{
    return await _coreRepository.getSpecialties();
  }

}