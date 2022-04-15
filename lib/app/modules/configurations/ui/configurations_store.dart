import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mobx/mobx.dart';

part 'configurations_store.g.dart';

class ConfigurationsStore = _ConfigurationsStoreBase with _$ConfigurationsStore;
abstract class _ConfigurationsStoreBase with Store {

  late final TextEditingController nameEditingController;
  late final TextEditingController passEditingController;
  late final TextEditingController emailEditingController;
  late final MaskedTextController phoneEditingController;

  @observable
  DateTime? birthday;

  @observable
  int? levelId;

  @observable
  late bool smsNotifies;

  @observable
  late bool emailNotifies;

  @observable
  late bool pushNotifies;

  @observable
  late bool desktopNotifies;

  _ConfigurationsStoreBase(){
    nameEditingController = TextEditingController();
    passEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    phoneEditingController = MaskedTextController(mask: '(00) 0 00000000');
  }

  void dispose(){
    nameEditingController.dispose();
    passEditingController.dispose();
    emailEditingController.dispose();
    phoneEditingController.dispose();
  }

  @action
  void setBirthday(DateTime value){
    birthday = value;
  }

  @action
  void setLevel(int value){
    levelId = value;
  }

  @action
  void setSmsNotifies(bool value){
    smsNotifies = value;
  }

  @action
  void setEmailNotifies(bool value){
    emailNotifies = value;
  }

  @action
  void setPushNotifies(bool value){
    pushNotifies = value;
  }

  @action
  void setDestopNotifies(bool value){
    desktopNotifies = value;
  }

}