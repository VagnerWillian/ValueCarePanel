// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PatientDetailsStore on _PatientDetailsStoreBase, Store {
  final _$scoreGraphicDataListAtom =
      Atom(name: '_PatientDetailsStoreBase.scoreGraphicDataList');

  @override
  ObservableList<BasicValueChartDataEntity> get scoreGraphicDataList {
    _$scoreGraphicDataListAtom.reportRead();
    return super.scoreGraphicDataList;
  }

  @override
  set scoreGraphicDataList(ObservableList<BasicValueChartDataEntity> value) {
    _$scoreGraphicDataListAtom.reportWrite(value, super.scoreGraphicDataList,
        () {
      super.scoreGraphicDataList = value;
    });
  }

  final _$reportedSymptomGroupEntityAtom =
      Atom(name: '_PatientDetailsStoreBase.reportedSymptomGroupEntity');

  @override
  ReportedSymptomGroupEntity? get reportedSymptomGroupEntity {
    _$reportedSymptomGroupEntityAtom.reportRead();
    return super.reportedSymptomGroupEntity;
  }

  @override
  set reportedSymptomGroupEntity(ReportedSymptomGroupEntity? value) {
    _$reportedSymptomGroupEntityAtom
        .reportWrite(value, super.reportedSymptomGroupEntity, () {
      super.reportedSymptomGroupEntity = value;
    });
  }

  final _$patientDetailsAtom =
      Atom(name: '_PatientDetailsStoreBase.patientDetails');

  @override
  PatientEntity? get patientDetails {
    _$patientDetailsAtom.reportRead();
    return super.patientDetails;
  }

  @override
  set patientDetails(PatientEntity? value) {
    _$patientDetailsAtom.reportWrite(value, super.patientDetails, () {
      super.patientDetails = value;
    });
  }

  final _$_PatientDetailsStoreBaseActionController =
      ActionController(name: '_PatientDetailsStoreBase');

  @override
  dynamic setPatientDetails(PatientEntity patient) {
    final _$actionInfo = _$_PatientDetailsStoreBaseActionController.startAction(
        name: '_PatientDetailsStoreBase.setPatientDetails');
    try {
      return super.setPatientDetails(patient);
    } finally {
      _$_PatientDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setReportedSymptomGroup(ReportedSymptomGroupEntity value) {
    final _$actionInfo = _$_PatientDetailsStoreBaseActionController.startAction(
        name: '_PatientDetailsStoreBase.setReportedSymptomGroup');
    try {
      return super.setReportedSymptomGroup(value);
    } finally {
      _$_PatientDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addAllScoreGraphicData(List<BasicValueChartDataEntity> values) {
    final _$actionInfo = _$_PatientDetailsStoreBaseActionController.startAction(
        name: '_PatientDetailsStoreBase.addAllScoreGraphicData');
    try {
      return super.addAllScoreGraphicData(values);
    } finally {
      _$_PatientDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scoreGraphicDataList: ${scoreGraphicDataList},
reportedSymptomGroupEntity: ${reportedSymptomGroupEntity},
patientDetails: ${patientDetails}
    ''';
  }
}
