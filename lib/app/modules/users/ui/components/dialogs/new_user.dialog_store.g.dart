// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user.dialog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewUserDialogStore on _NewUserDialogStoreBase, Store {
  final _$loadingAtom = Atom(name: '_NewUserDialogStoreBase.loading');

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

  final _$userAtom = Atom(name: '_NewUserDialogStoreBase.user');

  @override
  UserEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_NewUserDialogStoreBaseActionController =
      ActionController(name: '_NewUserDialogStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_NewUserDialogStoreBaseActionController.startAction(
        name: '_NewUserDialogStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_NewUserDialogStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserCreated(UserEntity value) {
    final _$actionInfo = _$_NewUserDialogStoreBaseActionController.startAction(
        name: '_NewUserDialogStoreBase.setUserCreated');
    try {
      return super.setUserCreated(value);
    } finally {
      _$_NewUserDialogStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
user: ${user}
    ''';
  }
}
