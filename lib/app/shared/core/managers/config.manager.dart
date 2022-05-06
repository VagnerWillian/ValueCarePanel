import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/core/domain/usecases/get_classifications.usecase.dart';
import 'package:value_panel/app/shared/core/domain/usecases/get_especialties.usecase.dart';

import '../../../utils/utils.dart';
import '../preferences/local_preferences.dart';

class ConfigManager {

  final LocalPreferences _localPreferences;
  final GetSpecialtiesUseCase _getSpecialtiesUseCase;
  final GetClassificationsUseCase _getClassificationsUseCase;

  ConfigManager(this._localPreferences, this._getClassificationsUseCase, this._getSpecialtiesUseCase);

  late bool isFirstAccess;
  late String tokenUserLogged;
  late String rememberEmail;
  late List<ClassificationEntity> classifications = [];
  late List<SpecialtyEntity> specialties = [];

  Future initialize()async{
    await loadConfigOfLocalData();
  }

  Future loadConfigOfLocalData() async {
    isFirstAccess = await _getHasFirstAccess;
    tokenUserLogged = await _getHasTokenUserLogged;
    rememberEmail = await _getRememberEmail;
  }

  Future remoteConfigOfRemoteData()async{
    classifications = await _getClassificationsUseCase();
    specialties = await _getSpecialtiesUseCase();
  }

  // CONFIGURAÇÕES PRINCIPAIS
  Future<bool> get _getHasFirstAccess async => await _localPreferences.getDataToBool(key: FIRST_ACCESS_KEY);
  setHasFirstAccess(bool value) async => isFirstAccess = await _localPreferences.setDataFromBool(key: FIRST_ACCESS_KEY, value: value);

  Future<String> get _getHasTokenUserLogged async => await _localPreferences.getDataFromString(key: TOKEN_USER_LOGGED_KEY);
  setHasTokenUserLogged(String value) async => tokenUserLogged = await _localPreferences.setDataToString(key: TOKEN_USER_LOGGED_KEY, value: value);

  Future<String> get _getRememberEmail async => await _localPreferences.getDataFromString(key: EMAIL_REMEMBER);
  setHasRememberEmail(String value) async => rememberEmail = await _localPreferences.setDataToString(key: EMAIL_REMEMBER, value: value);
}