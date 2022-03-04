import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/users/domain/usecases/create_user.usecase.dart';

part 'new_user.dialog_store.g.dart';

class NewUserDialogStore = _NewUserDialogStoreBase with _$NewUserDialogStore;
abstract class _NewUserDialogStoreBase with Store {

  //UseCases
  final CreateUserUseCase _createUserUseCase;

  _NewUserDialogStoreBase(this._createUserUseCase);

  //OBSERVABLES

  @observable
  bool loading = false;

  //ACTIONS

  @action
  void setLoading(bool value)=>loading=value;

  Future newUser(Function onError, {required String name, required String email, required String phone, required String level})async{
    setLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    setLoading(false);
  }

}