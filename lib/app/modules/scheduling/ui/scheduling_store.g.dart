// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SchedulingStore on _SchedulingStoreBase, Store {
  final _$dateSelectorAtom = Atom(name: '_SchedulingStoreBase.dateSelector');

  @override
  DateSelector? get dateSelector {
    _$dateSelectorAtom.reportRead();
    return super.dateSelector;
  }

  @override
  set dateSelector(DateSelector? value) {
    _$dateSelectorAtom.reportWrite(value, super.dateSelector, () {
      super.dateSelector = value;
    });
  }

  final _$loadingSchedulingItemsAtom =
      Atom(name: '_SchedulingStoreBase.loadingSchedulingItems');

  @override
  bool get loadingSchedulingItems {
    _$loadingSchedulingItemsAtom.reportRead();
    return super.loadingSchedulingItems;
  }

  @override
  set loadingSchedulingItems(bool value) {
    _$loadingSchedulingItemsAtom
        .reportWrite(value, super.loadingSchedulingItems, () {
      super.loadingSchedulingItems = value;
    });
  }

  final _$loadingUpdateSchedulingItemAtom =
      Atom(name: '_SchedulingStoreBase.loadingUpdateSchedulingItem');

  @override
  bool get loadingUpdateSchedulingItem {
    _$loadingUpdateSchedulingItemAtom.reportRead();
    return super.loadingUpdateSchedulingItem;
  }

  @override
  set loadingUpdateSchedulingItem(bool value) {
    _$loadingUpdateSchedulingItemAtom
        .reportWrite(value, super.loadingUpdateSchedulingItem, () {
      super.loadingUpdateSchedulingItem = value;
    });
  }

  final _$_SchedulingStoreBaseActionController =
      ActionController(name: '_SchedulingStoreBase');

  @override
  void setDateSelector(DateSelector value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setDateSelector');
    try {
      return super.setDateSelector(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingSchedulingItems(bool value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setLoadingSchedulingItems');
    try {
      return super.setLoadingSchedulingItems(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingUpdateSchedulingItem(bool value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setLoadingUpdateSchedulingItem');
    try {
      return super.setLoadingUpdateSchedulingItem(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateSelector: ${dateSelector},
loadingSchedulingItems: ${loadingSchedulingItems},
loadingUpdateSchedulingItem: ${loadingUpdateSchedulingItem}
    ''';
  }
}
