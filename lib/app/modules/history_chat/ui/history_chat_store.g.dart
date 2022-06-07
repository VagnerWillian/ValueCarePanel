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

  final _$isFullHeightAtom = Atom(name: '_HistoryChatStoreBase.isFullHeight');

  @override
  bool get isFullHeight {
    _$isFullHeightAtom.reportRead();
    return super.isFullHeight;
  }

  @override
  set isFullHeight(bool value) {
    _$isFullHeightAtom.reportWrite(value, super.isFullHeight, () {
      super.isFullHeight = value;
    });
  }

  final _$selectedIdPatientAtom =
      Atom(name: '_HistoryChatStoreBase.selectedIdPatient');

  @override
  List<String> get selectedPatient {
    _$selectedIdPatientAtom.reportRead();
    return super.selectedPatient;
  }

  @override
  set selectedPatient(List<String> values) {
    _$selectedIdPatientAtom.reportWrite(values, super.selectedPatient, () {
      super.selectedPatient = values;
    });
  }

  final _$loadingAtom = Atom(name: '_HistoryChatStoreBase.loading');

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

  final _$loadingSendAtom = Atom(name: '_HistoryChatStoreBase.loadingSend');

  @override
  bool get loadingSend {
    _$loadingSendAtom.reportRead();
    return super.loadingSend;
  }

  @override
  set loadingSend(bool value) {
    _$loadingSendAtom.reportWrite(value, super.loadingSend, () {
      super.loadingSend = value;
    });
  }

  final _$itemsAtom = Atom(name: '_HistoryChatStoreBase.items');

  @override
  ObservableList<HistoryItemEntity> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<HistoryItemEntity> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
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
  void open({required String idUserPatient, required String idPatient, dynamic isFullHeight = false}) {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase.open');
    try {
      return super.open(idUserPatient: idUserPatient, idPatient: idPatient, isFullHeight: isFullHeight);
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _addAllItem(List<HistoryItemEntity> values) {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase._addAllItem');
    try {
      return super._addAllItem(values);
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _addItem(HistoryItemEntity value) {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase._addItem');
    try {
      return super._addItem(value);
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _deleteItem(String value) {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase._deleteItem');
    try {
      return super._deleteItem(value);
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setLoading(bool value) {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase._setLoading');
    try {
      return super._setLoading(value);
    } finally {
      _$_HistoryChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoadingSend(bool value) {
    final _$actionInfo = _$_HistoryChatStoreBaseActionController.startAction(
        name: '_HistoryChatStoreBase.setLoadingSend');
    try {
      return super.setLoadingSend(value);
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
isFullHeight: ${isFullHeight},
selectedIdPatient: ${selectedPatient},
loading: ${loading},
loadingSend: ${loadingSend},
items: ${items}
    ''';
  }
}
