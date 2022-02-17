// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$actuallyRouteAtom = Atom(name: 'HomeStoreBase.actuallyRoute');

  @override
  String get actuallyRoute {
    _$actuallyRouteAtom.reportRead();
    return super.actuallyRoute;
  }

  @override
  set actuallyRoute(String value) {
    _$actuallyRouteAtom.reportWrite(value, super.actuallyRoute, () {
      super.actuallyRoute = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setRoute(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setRoute');
    try {
      return super.setRoute(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actuallyRoute: ${actuallyRoute}
    ''';
  }
}
