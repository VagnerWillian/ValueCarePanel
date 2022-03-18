import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:value_panel/app/modules/login/domain/usecases/save_token.usecase.dart';
import 'package:value_panel/app/modules/login/domain/usecases/signin_email_pass.usecase.dart';
import 'package:value_panel/app/modules/login/errors/login.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  //Stores
  late final TextEditingController emailEditingController;
  late final TextEditingController passEditingController;
  late final RoundedLoadingButtonController btnController;

  //Keys
  final loginFormKey = GlobalKey<FormState>();

  //UseCases
  final SignInUseCase _signInUseCase;
  final SaveTokenUseCase _saveTokenUseCase;

  //Managers
  final ConfigManager _configManager;

  _LoginStoreBase(
      this._configManager,
      this._signInUseCase,
      this._saveTokenUseCase){
    emailEditingController = TextEditingController();
    passEditingController = TextEditingController();
    btnController = RoundedLoadingButtonController();
    if(kDebugMode){
      emailEditingController.text = "rodrigo@valuecare.com.br";
      passEditingController.text = "value@2022";
    }
    initialize();
  }

  //Observables

  @observable
  bool loadingInitialing = true;

  //Actions
  void setLoadingInitialing(bool value)=>loadingInitialing=value;


  //Voids

  void dispose(){
    emailEditingController.dispose();
    passEditingController.dispose();
  }

  void initialize()async{
    await _configManager.initialize();
    await verifyUserLogged();
  }

  Future verifyUserLogged() async {
    if(_configManager.tokenUserLogged.isNotEmpty) {
      await openMain();
    }
    setLoadingInitialing(false);
  }

  void signIn({required Function onError})async{
    if(loginFormKey.currentState!.validate()){
      Either<LoginError, UserEntity> result = await _signInUseCase(email: emailEditingController.text, pass: passEditingController.text);
      await result.fold((LoginError failure)async{
        if(failure is LoginRepositoryError){
          onError(failure);
          btnController.error();
          await Future.delayed(const Duration(seconds: 1));
          btnController.reset();
        }
        return failure;
      }, (UserEntity user) async{
        btnController.success();
        await Future.delayed(const Duration(seconds: 1));
        await saveTokenAndOpenMain(user, onError);
        return user;
      });
    }else{
      btnController.error();
      await Future.delayed(const Duration(seconds: 1));
      btnController.reset();
    }
  }

  Future saveTokenAndOpenMain(UserEntity userEntity, Function onError)async{
    Either<LoginError, String> result = await _saveTokenUseCase(token: userEntity.token);
    result.fold((LoginError failure) {
      onError(failure);
      return failure;
    }, (String value) async{
      await openMain();
      return value;
    });
  }

  Future openMain()async{
   await Modular.to.pushReplacementNamed(Modular.initialRoute);
  }
}