import 'package:either_dart/either.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/users/domain/usecases/create_user.usecase.dart';
import 'package:value_panel/app/modules/users/domain/usecases/deactivate_user.usecase.dart';
import 'package:value_panel/app/modules/users/domain/usecases/delete_user.usecase.dart';
import 'package:value_panel/app/modules/users/domain/usecases/get_users.usecase.dart';
import 'package:value_panel/app/modules/users/errors/users_errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

import '../domain/usecases/activate_user.usecase.dart';

part 'users_store.g.dart';

class UsersStore = _UsersStoreBase with _$UsersStore;
abstract class _UsersStoreBase with Store {

  //UseCases
  final GetUsersUseCase _getUsersUseCase;
  final ActivateUserUseCase _activateUserUseCase;
  final DeactivateUserUseCase _deactivateUserUseCase;
  final DeleteUserUseCase _deleteUserUseCase;

  //Others
  final List<UserEntity> _usersBackup = [];


  // OBSERVABLES

  @observable
  bool loading = false;

  @observable
  ObservableList<UserEntity> usersList = ObservableList<UserEntity>();

  _UsersStoreBase(this._getUsersUseCase, this._activateUserUseCase, this._deactivateUserUseCase, this._deleteUserUseCase);

  // ACTIONS

  @action
  void setLoading(bool value)=>loading=value;

  @action
  void addAllUsers(List<UserEntity> values) {
    usersList.clear();
    usersList.addAll(values);
  }

  @action
  void addUser(UserEntity userEntity) {
    usersList.add(userEntity);
  }

  @action
  void insertUser(UserEntity userEntity, int position){
    usersList.insert(position, userEntity);
  }

  @action
  void removeUser(UserEntity userEntity){
    usersList.remove(userEntity);
  }

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

  Future activateOperator({required String operatorId, required Function onError})async{
    Either<UsersError, bool> response = await _activateUserUseCase(operatorId: operatorId);
    if(response.isLeft){
      await onError(response.left);
    }else{
      UserEntity userEntity = usersList.singleWhere((u) => u.id==operatorId);
      int position = usersList.indexOf(userEntity);
      userEntity.userActive = true;
      removeUser(usersList.singleWhere((u) => u.id==operatorId));
      insertUser(userEntity, position);
    }
  }

  Future deactivateOperator({required String operatorId, required Function onError})async{
    Either<UsersError, bool> response = await _deactivateUserUseCase(operatorId: operatorId);
    if(response.isLeft){
      await onError(response.left);
    }else{
      UserEntity userEntity = usersList.singleWhere((u) => u.id==operatorId);
      int position = usersList.indexOf(userEntity);
      userEntity.userActive = false;
      removeUser(usersList.singleWhere((u) => u.id==operatorId));
      insertUser(userEntity, position);
    }
  }

  Future deleteOperator({required String operatorId, required Function onError})async{
    Either<UsersError, bool> response = await _deleteUserUseCase(operatorId: operatorId);
    if(response.isLeft){
      await onError(response.left);
    }else{
      removeUser(usersList.singleWhere((u) => u.id==operatorId));
    }
  }

  onChangedSearchText(String text)async{
    if(text.isNotEmpty) {
      List<UserEntity> searchList = _usersBackup.where((u) {
        String? name = u.name.toLowerCase();
        String? level = u.levelAccess.toLowerCase();
        String? phone = u.phone.toLowerCase();
        String? email = u.email.toLowerCase();
        return name.contains(text.toLowerCase())||level.contains(text.toLowerCase())||phone.contains(text.toLowerCase())||email.contains(text.toLowerCase());
      }).toList();
      addAllUsers(searchList);
    }else{
      addAllUsers(_usersBackup);
    }
  }

}