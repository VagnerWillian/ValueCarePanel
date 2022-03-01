import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/monitoring/ui/monitoring_store.dart';
import 'package:value_panel/app/shared/core/domain/entities/hospital.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  late HospitalEntity selectedHospital;
  late UserEntity selectedUser;

  @observable
  late String actuallyRoute = Modular.to.path;

  @action
  void setRoute(String value)=>actuallyRoute=value;

  void navigateTo(String path){
    Modular.to.navigate(path);
    setRoute(path);
  }

}