// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MonitoringStore on _MonitoringStoreBase, Store {
  final _$dateSelectorAtom = Atom(name: '_MonitoringStoreBase.dateSelector');

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

  final _$loadingMonitoringItemsAtom =
      Atom(name: '_MonitoringStoreBase.loadingMonitoringItems');

  @override
  bool get loadingMonitoringItems {
    _$loadingMonitoringItemsAtom.reportRead();
    return super.loadingMonitoringItems;
  }

  @override
  set loadingMonitoringItems(bool value) {
    _$loadingMonitoringItemsAtom
        .reportWrite(value, super.loadingMonitoringItems, () {
      super.loadingMonitoringItems = value;
    });
  }

  final _$monitoringDataItemsAtom =
      Atom(name: '_MonitoringStoreBase.monitoringDataItems');

  @override
  ObservableList<MonitoringDataEntity> get monitoringDataItems {
    _$monitoringDataItemsAtom.reportRead();
    return super.monitoringDataItems;
  }

  @override
  set monitoringDataItems(ObservableList<MonitoringDataEntity> value) {
    _$monitoringDataItemsAtom.reportWrite(value, super.monitoringDataItems, () {
      super.monitoringDataItems = value;
    });
  }

  final _$_MonitoringStoreBaseActionController =
      ActionController(name: '_MonitoringStoreBase');

  @override
  void setDateSelector(DateSelector value) {
    final _$actionInfo = _$_MonitoringStoreBaseActionController.startAction(
        name: '_MonitoringStoreBase.setDateSelector');
    try {
      return super.setDateSelector(value);
    } finally {
      _$_MonitoringStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingMonitoringItems(bool value) {
    final _$actionInfo = _$_MonitoringStoreBaseActionController.startAction(
        name: '_MonitoringStoreBase.setLoadingMonitoringItems');
    try {
      return super.setLoadingMonitoringItems(value);
    } finally {
      _$_MonitoringStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllMonitoringItems(List<MonitoringDataEntity> items) {
    final _$actionInfo = _$_MonitoringStoreBaseActionController.startAction(
        name: '_MonitoringStoreBase.addAllMonitoringItems');
    try {
      return super.addAllMonitoringItems(items);
    } finally {
      _$_MonitoringStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateSelector: ${dateSelector},
loadingMonitoringItems: ${loadingMonitoringItems},
monitoringDataItems: ${monitoringDataItems}
    ''';
  }
}
