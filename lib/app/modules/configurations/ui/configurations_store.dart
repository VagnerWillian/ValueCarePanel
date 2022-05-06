import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/app_store.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';

part 'configurations_store.g.dart';

class ConfigurationsStore = _ConfigurationsStoreBase with _$ConfigurationsStore;
abstract class _ConfigurationsStoreBase with Store {

  //Stores
  final AppStore _appStore;

  //Controllers
  late final TextEditingController nameEditingController;
  late final TextEditingController passEditingController;
  late final TextEditingController emailEditingController;
  late final MaskedTextController phoneEditingController;

  @observable
  DateTime? birthday;

  @observable
  int? level;

  @observable
  bool smsNotifies = false;

  @observable
  bool emailNotifies = false;

  @observable
  bool pushNotifies = false;

  @observable
  bool desktopNotifies = false;

  @observable
  String image = "";

  _ConfigurationsStoreBase(this._appStore){
    nameEditingController = TextEditingController();
    passEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    phoneEditingController = MaskedTextController(mask: '(00) 0 00000000');

    if(_appStore.loggedUser!=null){
      nameEditingController.text = _appStore.loggedUser!.name;
      emailEditingController.text = _appStore.loggedUser!.email;
      phoneEditingController.text = _appStore.loggedUser!.phone;
      image = _appStore.loggedUser!.picture;
      desktopNotifies = _appStore.loggedUser!.desktopNotifies;
      smsNotifies = _appStore.loggedUser!.smsNotifies;
      emailNotifies = _appStore.loggedUser!.emailNotifies;
      pushNotifies = _appStore.loggedUser!.pushNotifies;
    }

  }

  void dispose(){
    nameEditingController.dispose();
    passEditingController.dispose();
    emailEditingController.dispose();
    phoneEditingController.dispose();
  }

  @action
  void setImagePath(String value){
    image = value;
  }

  @action
  void setBirthday(DateTime value){
    birthday = value;
  }

  @action
  void setLevel(int value){
    level = value;
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