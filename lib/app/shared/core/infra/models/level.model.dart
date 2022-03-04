import 'package:value_panel/app/shared/core/domain/entities/level.entity.dart';

class LevelAdmin implements LevelAdminEntity{

  @override
  late final int id;

  @override
  late final String level;

  LevelAdmin({required this.id, required this.level});
}