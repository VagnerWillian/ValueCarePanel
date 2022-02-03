// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardStore on _DashboardStoreBase, Store {
  final _$loadingAtom = Atom(name: '_DashboardStoreBase.loading');

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

  final _$_DashboardStoreBaseActionController =
      ActionController(name: '_DashboardStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.setLoading');
    try {
      return super.setLoading(value);
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
  String toString() {
    return '''
loading: ${loading},
dateSelector: ${dateSelector},
preDates: ${preDates}
    ''';
  }
}
