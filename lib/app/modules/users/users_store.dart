import 'package:either_dart/either.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/users/domain/usecases/get_users.usecase.dart';
import 'package:value_panel/app/modules/users/errors/scheduling.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

part 'users_store.g.dart';

class UsersStore = _UsersStoreBase with _$UsersStore;
abstract class _UsersStoreBase with Store {

  final GetUsersUseCase _getUsersUseCase;
  final List<UserEntity> _usersBackup = [];

  // OBSERVABLES

  @observable
  bool loading = false;

  @observable
  ObservableList<UserEntity> usersList = ObservableList<UserEntity>();

  // ACTIONS

  @action
  void setLoading(bool value)=>loading=value;

  @action
  void addAllUsers(List<UserEntity> values) {
    usersList.clear();
    usersList.addAll(values);
  }

  _UsersStoreBase(this._getUsersUseCase);

  Future<void> getUsers(Function onError)async{
    setLoading(true);
    Either<UsersError, List<UserEntity>> response = await _getUsersUseCase();
    response.fold((UsersError failure) async{
      await onError(failure);
      _usersBackup.addAll([]);
      addAllUsers([]);
      return failure;
    }, (List<UserEntity> values) {
      _usersBackup.addAll(values);
      addAllUsers(values);
      return values;
    });
    setLoading(false);
  }
}