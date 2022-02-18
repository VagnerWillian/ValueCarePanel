// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardStore on _DashboardStoreBase, Store {
  final _$loadingAnalyticsAtom =
      Atom(name: '_DashboardStoreBase.loadingAnalytics');

  @override
  bool get loadingAnalytics {
    _$loadingAnalyticsAtom.reportRead();
    return super.loadingAnalytics;
  }

  @override
  set loadingAnalytics(bool value) {
    _$loadingAnalyticsAtom.reportWrite(value, super.loadingAnalytics, () {
      super.loadingAnalytics = value;
    });
  }

  final _$loadingMonitoringItemsAtom =
      Atom(name: '_DashboardStoreBase.loadingMonitoringItems');

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

  final _$loadingUpdateMonitoringItemsAtom =
      Atom(name: '_DashboardStoreBase.loadingUpdateMonitoringItems');

  @override
  bool get loadingUpdateMonitoringItems {
    _$loadingUpdateMonitoringItemsAtom.reportRead();
    return super.loadingUpdateMonitoringItems;
  }

  @override
  set loadingUpdateMonitoringItems(bool value) {
    _$loadingUpdateMonitoringItemsAtom
        .reportWrite(value, super.loadingUpdateMonitoringItems, () {
      super.loadingUpdateMonitoringItems = value;
    });
  }

  final _$dateSelectorAtom = Atom(name: '_DashboardStoreBase.dateSelector');

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

  final _$preDatesAtom = Atom(name: '_DashboardStoreBase.preDates');

  @override
  ObservableList<DateSelector> get preDates {
    _$preDatesAtom.reportRead();
    return super.preDates;
  }

  @override
  set preDates(ObservableList<DateSelector> value) {
    _$preDatesAtom.reportWrite(value, super.preDates, () {
      super.preDates = value;
    });
  }

  final _$comparisonGroupChartDataAtom =
      Atom(name: '_DashboardStoreBase.comparisonGroupChartData');

  @override
  ComparisonGroupChartDataEntity get comparisonGroupChartData {
    _$comparisonGroupChartDataAtom.reportRead();
    return super.comparisonGroupChartData;
  }

  @override
  set comparisonGroupChartData(ComparisonGroupChartDataEntity value) {
    _$comparisonGroupChartDataAtom
        .reportWrite(value, super.comparisonGroupChartData, () {
      super.comparisonGroupChartData = value;
    });
  }

  final _$_DashboardStoreBaseActionController =
      ActionController(name: '_DashboardStoreBase');

  @override
  void setLoadingAnalytics(bool value) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.setLoadingAnalytics');
    try {
      return super.setLoadingAnalytics(value);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingMonitoring(bool value) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.setLoadingMonitoring');
    try {
      return super.setLoadingMonitoring(value);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingUpdateMonitoring(bool value) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.setLoadingUpdateMonitoring');
    try {
      return super.setLoadingUpdateMonitoring(value);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateSelector(DateSelector value) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.setDateSelector');
    try {
      return super.setDateSelector(value);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPreDates(DateSelector value) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.addPreDates');
    try {
      return super.addPreDates(value);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setComparisonChartGroup(ComparisonGroupChartDataEntity value) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.setComparisonChartGroup');
    try {
      return super.setComparisonChartGroup(value);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingAnalytics: ${loadingAnalytics},
loadingMonitoringItems: ${loadingMonitoringItems},
loadingUpdateMonitoringItems: ${loadingUpdateMonitoringItems},
dateSelector: ${dateSelector},
preDates: ${preDates},
comparisonGroupChartData: ${comparisonGroupChartData}
    ''';
  }
}
