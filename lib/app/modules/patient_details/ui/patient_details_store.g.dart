// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PatientDetailsStore on _PatientDetailsStoreBase, Store {
  final _$valueAtom = Atom(name: '_PatientDetailsStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_PatientDetailsStoreBaseActionController =
      ActionController(name: '_PatientDetailsStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_PatientDetailsStoreBaseActionController.startAction(
        name: '_PatientDetailsStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PatientDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
