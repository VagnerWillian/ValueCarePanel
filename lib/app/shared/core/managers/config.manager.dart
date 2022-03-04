import '../../../utils/utils.dart';
import '../preferences/local_preferences.dart';

class ConfigManager {

  final LocalPreferences _localPreferences;

  ConfigManager(this._localPreferences);

  late bool isFirstAccess;
  late String tokenUserLogged;
  late String rememberEmail;

  Future initialize()async{
    await loadConfigFromLocalData();
  }

  Future loadConfigFromLocalData() async {
    isFirstAccess = await _getHasFirstAccess;
    tokenUserLogged = await _getHasTokenUserLogged;
    rememberEmail = await _getRememberEmail;
  }

  // CONFIGURAÇÕES PRINCIPAIS
  Future<bool> get _getHasFirstAccess async => await _localPreferences.getDataToBool(key: FIRST_ACCESS_KEY);
  setHasFirstAccess(bool value) async => isFirstAccess = await _localPreferences.setDataFromBool(key: FIRST_ACCESS_KEY, value: value);

  Future<String> get _getHasTokenUserLogged async => await _localPreferences.getDataFromString(key: TOKEN_USER_LOGGED_KEY);
  setHasTokenUserLogged(String value) async => tokenUserLogged = await _localPreferences.setDataToString(key: TOKEN_USER_LOGGED_KEY, value: value);

  Future<String> get _getRememberEmail async => await _localPreferences.getDataFromString(key: EMAIL_REMEMBER);
  setHasRememberEmail(String value) async => rememberEmail = await _localPreferences.setDataToString(key: EMAIL_REMEMBER, value: value);
}