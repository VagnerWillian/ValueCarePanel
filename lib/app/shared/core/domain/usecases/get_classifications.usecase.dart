import '../entities/classification.entity.dart';

abstract class GetClassificationsUseCase{
  Future<List<ClassificationEntity>> call();
}