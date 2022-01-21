import 'package:mobx/mobx.dart';
import 'package:value_panel/app/shared/domain/entities/hospital.entity.dart';
import 'package:value_panel/app/shared/domain/entities/user.entity.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  late HospitalEntity selectedHospital;
  late UserEntity selectedUser;

}