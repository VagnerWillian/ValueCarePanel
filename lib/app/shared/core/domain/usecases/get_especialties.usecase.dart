import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';

abstract class GetSpecialtiesUseCase{
  Future<List<SpecialtyEntity>> call();
}