// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.component_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoryFloatingStore on HistoryFloatingStoreBase, Store {
  final _$isExpandedAtom = Atom(name: 'HistoryFloatingStoreBase.isExpanded');

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

  final _$showAtom = Atom(name: 'HistoryFloatingStoreBase.show');

  @override
  bool get show {
    _$showAtom.reportRead();
    return super.show;
  }

  @override
  set show(bool value) {
    _$showAtom.reportWrite(value, super.show, () {
      super.show = value;
    });
  }

  final _$HistoryFloatingStoreBaseActionController =
      ActionController(name: 'HistoryFloatingStoreBase');

  @override
  void expand() {
    final _$actionInfo = _$HistoryFloatingStoreBaseActionController.startAction(
        name: 'HistoryFloatingStoreBase.expand');
    try {
      return super.expand();
    } finally {
      _$HistoryFloatingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void shrink() {
    final _$actionInfo = _$HistoryFloatingStoreBaseActionController.startAction(
        name: 'HistoryFloatingStoreBase.shrink');
    try {
      return super.shrink();
    } finally {
      _$HistoryFloatingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void collapse() {
    final _$actionInfo = _$HistoryFloatingStoreBaseActionController.startAction(
        name: 'HistoryFloatingStoreBase.collapse');
    try {
      return super.collapse();
    } finally {
      _$HistoryFloatingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void open() {
    final _$actionInfo = _$HistoryFloatingStoreBaseActionController.startAction(
        name: 'HistoryFloatingStoreBase.open');
    try {
      return super.open();
    } finally {
      _$HistoryFloatingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void close() {
    final _$actionInfo = _$HistoryFloatingStoreBaseActionController.startAction(
        name: 'HistoryFloatingStoreBase.close');
    try {
      return super.close();
    } finally {
      _$HistoryFloatingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isExpanded: ${isExpanded},
show: ${show}
    ''';
  }
}
