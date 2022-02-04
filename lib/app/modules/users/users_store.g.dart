// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersStore on _UsersStoreBase, Store {
  final _$loadingAtom = Atom(name: '_UsersStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$usersListAtom = Atom(name: '_UsersStoreBase.usersList');

  @override
  ObservableList<UserEntity> get usersList {
    _$usersListAtom.reportRead();
    return super.usersList;
  }

  @override
  set usersList(ObservableList<UserEntity> value) {
    _$usersListAtom.reportWrite(value, super.usersList, () {
      super.usersList = value;
    });
  }

  final _$_UsersStoreBaseActionController =
      ActionController(name: '_UsersStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_UsersStoreBaseActionController.startAction(
        name: '_UsersStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_UsersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllUsers(List<UserEntity> values) {
    final _$actionInfo = _$_UsersStoreBaseActionController.startAction(
        name: '_UsersStoreBase.addAllUsers');
    try {
      return super.addAllUsers(values);
    } finally {
      _$_UsersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
usersList: ${usersList}
    ''';
  }
}
