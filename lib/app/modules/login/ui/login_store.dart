import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/modules/login/domain/usecases/get_token.usecase.dart';
import 'package:value_panel/app/modules/login/domain/usecases/save_token.usecase.dart';
import 'package:value_panel/app/modules/login/domain/usecases/signin.usecase.dart';
import 'package:value_panel/app/modules/login/errors/login.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/utils/utils.dart';

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
  final GetTokenUseCase _getTokenUseCase;

  _LoginStoreBase(
      this._signInUseCase,
      this._saveTokenUseCase,
      this._getTokenUseCase){
    emailEditingController = TextEditingController();
    passEditingController = TextEditingController();
    btnController = RoundedLoadingButtonController();
    if(kDebugMode){
      emailEditingController.text = "rodrigo@valuecare.com.br";
      passEditingController.text = "value@2022";
    }
  }

  void dispose(){
    emailEditingController.dispose();
    passEditingController.dispose();
  }

  void signIn({required Function onError})async{
    if(loginFormKey.currentState!.validate()){
      Either<LoginError, UserEntity> result = await _signInUseCase(email: emailEditingController.text, pass: passEditingController.text);
      result.fold((LoginError failure) {
        if(failure is LoginRepositoryError){
          btnController.error();
          onError(failure);
        }else{

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
    }
    await Future.delayed(const Duration(seconds: 1));
    btnController.reset();
  }

  Future saveTokenAndOpenMain(UserEntity userEntity, Function onError)async{
    Either<LoginError, String> result = await _saveTokenUseCase(token: userEntity.token);
    result.fold((LoginError failure) {
      onError(failure);
      return failure;
    }, (String value) {
      defineUserLoggedAndOpenMain(userEntity);
      return value;
    });
  }

  void defineUserLoggedAndOpenMain(UserEntity userEntity){
    Modular.to.pushReplacementNamed(Modular.initialRoute);
  }
}