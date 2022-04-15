import 'package:either_dart/either.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/core/domain/entities/user.entity.dart';
import '../../../domain/usecases/create_user.usecase.dart';
import '../../../errors/users_errors.dart';

part 'new_user.dialog_store.g.dart';

class NewUserDialogStore = _NewUserDialogStoreBase with _$NewUserDialogStore;
abstract class _NewUserDialogStoreBase with Store {

  //UseCases
  final CreateUserUseCase _createUserUseCase;

  _NewUserDialogStoreBase(this._createUserUseCase);

  //OBSERVABLES

  @observable
  bool loading = false;

  @observable
  UserEntity? user;

  //ACTIONS

  @action
  void setLoading(bool value)=>loading=value;

  @action
  void setUserCreated(UserEntity value)=>user=value;

  Future newUser(Function onError, {required String name, required String email, required String phone, required int level})async{
    print(name);
    setLoading(true);
    Either<UsersError, UserEntity> result = await _createUserUseCase.call(name: name, email: email, phone: phone, level: level);
    await result.fold((UsersError failure) async{
      await onError(failure);
      return failure;
    }, (UserEntity userEntity) async{
      setUserCreated(userEntity);
      await Future.delayed(const Duration(seconds: 1));
      Modular.to.pop(userEntity);
      return userEntity;
    });
    setLoading(false);
  }

}