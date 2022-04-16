// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configurations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigurationsStore on _ConfigurationsStoreBase, Store {
  final _$birthdayAtom = Atom(name: '_ConfigurationsStoreBase.birthday');

  @override
  DateTime? get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(DateTime? value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  final _$levelAtom = Atom(name: '_ConfigurationsStoreBase.level');

  @override
  int? get level {
    _$levelAtom.reportRead();
    return super.level;
  }

  @override
  set level(int? value) {
    _$levelAtom.reportWrite(value, super.level, () {
      super.level = value;
    });
  }

  final _$smsNotifiesAtom = Atom(name: '_ConfigurationsStoreBase.smsNotifies');

  @override
  bool get smsNotifies {
    _$smsNotifiesAtom.reportRead();
    return super.smsNotifies;
  }

  @override
  set smsNotifies(bool value) {
    _$smsNotifiesAtom.reportWrite(value, super.smsNotifies, () {
      super.smsNotifies = value;
    });
  }

  final _$emailNotifiesAtom =
      Atom(name: '_ConfigurationsStoreBase.emailNotifies');

  @override
  bool get emailNotifies {
    _$emailNotifiesAtom.reportRead();
    return super.emailNotifies;
  }

  @override
  set emailNotifies(bool value) {
    _$emailNotifiesAtom.reportWrite(value, super.emailNotifies, () {
      super.emailNotifies = value;
    });
  }

  final _$pushNotifiesAtom =
      Atom(name: '_ConfigurationsStoreBase.pushNotifies');

  @override
  bool get pushNotifies {
    _$pushNotifiesAtom.reportRead();
    return super.pushNotifies;
  }

  @override
  set pushNotifies(bool value) {
    _$pushNotifiesAtom.reportWrite(value, super.pushNotifies, () {
      super.pushNotifies = value;
    });
  }

  final _$desktopNotifiesAtom =
      Atom(name: '_ConfigurationsStoreBase.desktopNotifies');

  @override
  bool get desktopNotifies {
    _$desktopNotifiesAtom.reportRead();
    return super.desktopNotifies;
  }

  @override
  set desktopNotifies(bool value) {
    _$desktopNotifiesAtom.reportWrite(value, super.desktopNotifies, () {
      super.desktopNotifies = value;
    });
  }

  final _$imageAtom = Atom(name: '_ConfigurationsStoreBase.image');

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$_ConfigurationsStoreBaseActionController =
      ActionController(name: '_ConfigurationsStoreBase');

  @override
  void setImagePath(String value) {
    final _$actionInfo = _$_ConfigurationsStoreBaseActionController.startAction(
        name: '_ConfigurationsStoreBase.setImagePath');
    try {
      return super.setImagePath(value);
    } finally {
      _$_ConfigurationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthday(DateTime value) {
    final _$actionInfo = _$_ConfigurationsStoreBaseActionController.startAction(
        name: '_ConfigurationsStoreBase.setBirthday');
    try {
      return super.setBirthday(value);
    } finally {
      _$_ConfigurationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLevel(int value) {
    final _$actionInfo = _$_ConfigurationsStoreBaseActionController.startAction(
        name: '_ConfigurationsStoreBase.setLevel');
    try {
      return super.setLevel(value);
    } finally {
      _$_ConfigurationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSmsNotifies(bool value) {
    final _$actionInfo = _$_ConfigurationsStoreBaseActionController.startAction(
        name: '_ConfigurationsStoreBase.setSmsNotifies');
    try {
      return super.setSmsNotifies(value);
    } finally {
      _$_ConfigurationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailNotifies(bool value) {
    final _$actionInfo = _$_ConfigurationsStoreBaseActionController.startAction(
        name: '_ConfigurationsStoreBase.setEmailNotifies');
    try {
      return super.setEmailNotifies(value);
    } finally {
      _$_ConfigurationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPushNotifies(bool value) {
    final _$actionInfo = _$_ConfigurationsStoreBaseActionController.startAction(
        name: '_ConfigurationsStoreBase.setPushNotifies');
    try {
      return super.setPushNotifies(value);
    } finally {
      _$_ConfigurationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDestopNotifies(bool value) {
    final _$actionInfo = _$_ConfigurationsStoreBaseActionController.startAction(
        name: '_ConfigurationsStoreBase.setDestopNotifies');
    try {
      return super.setDestopNotifies(value);
    } finally {
      _$_ConfigurationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
birthday: ${birthday},
level: ${level},
smsNotifies: ${smsNotifies},
emailNotifies: ${emailNotifies},
pushNotifies: ${pushNotifies},
desktopNotifies: ${desktopNotifies},
image: ${image}
    ''';
  }
}
