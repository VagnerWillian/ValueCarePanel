// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoryChatStore on _HistoryChatStoreBase, Store {
  final _$isExpandedAtom = Atom(name: '_HistoryChatStoreBase.isExpanded');

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  final _$selectedIdPatientAtom =
      Atom(name: '_HistoryChatStoreBase.selectedIdPatient');

  @override
  String? get selectedIdPatient {
    _$selectedIdPatientAtom.reportRead();
    return super.selectedIdPatient;
  }

  @override
  set selectedIdPatient(String? value) {
    _$selectedIdPatientAtom.reportWrite(value, super.selectedIdPatient, () {
      super.selectedIdPatient = value;
    });
  }

  final _$_HistoryChatStoreBaseActionController =
      ActionController(name: '_HistoryChatStoreBase');

  @override
  void expand() {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase.expand');
    try {
      return super.expand();
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void shrink() {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase.shrink');
    try {
      return super.shrink();
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void collapse() {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase.collapse');
    try {
      return super.collapse();
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void open({required String idPatient}) {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase.open');
    try {
      return super.open(idPatient: idPatient);
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void close() {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase.close');
    try {
      return super.close();
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isExpanded: ${isExpanded},
selectedIdPatient: ${selectedIdPatient}
    ''';
  }
}
