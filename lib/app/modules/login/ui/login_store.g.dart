// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$loadingInitialingAtom =
      Atom(name: '_LoginStoreBase.loadingInitialing');

  @override
  bool get loadingInitialing {
    _$loadingInitialingAtom.reportRead();
    return super.loadingInitialing;
  }

  @override
  set loadingInitialing(bool value) {
    _$loadingInitialingAtom.reportWrite(value, super.loadingInitialing, () {
      super.loadingInitialing = value;
    });
  }

  @override
  String toString() {
    return '''
loadingInitialing: ${loadingInitialing}
    ''';
  }
}