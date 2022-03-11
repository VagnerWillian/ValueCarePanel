import 'package:mobx/mobx.dart';

part 'patients_store.g.dart';

class PatientsStore = _PatientsStoreBase with _$PatientsStore;
abstract class _PatientsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}