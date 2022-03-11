import 'package:mobx/mobx.dart';

part 'patient_details_store.g.dart';

class PatientDetailsStore = _PatientDetailsStoreBase with _$PatientDetailsStore;
abstract class _PatientDetailsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}