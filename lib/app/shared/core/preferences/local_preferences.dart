import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences{

  late SharedPreferences _prefs;

  loadInstance()async{
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> getDataToBool({required key, bool defaultValue = true}) async {
    await loadInstance();
    debugPrint("GET value from shared preferences of key => $key");
    return _prefs.getBool(key) ?? defaultValue;
  }

  Future<bool> setDataFromBool({required key, required bool value}) async {
    await loadInstance();
    debugPrint("SET value for shared preferences of key => $key");
    _prefs.setBool(key, value);
    return value;
  }


  Future<String> getDataFromString({required key}) async {
    await loadInstance();
    debugPrint("GET value from shared preferences of key => $key");
    return _prefs.getString(key) ?? "";
  }

  Future<String> setDataToString({required key, String value = ""}) async {
    await loadInstance();
    debugPrint("SET value for shared preferences of key => $key");
    await _prefs.setString(key, value);
    return value;
  }

  Future<int?> getDataFromInt({required key}) async {
    await loadInstance();
    debugPrint("GET value from shared preferences of key => $key");
    return _prefs.getInt(key) ?? null;
  }

  setDataToInt({required key, required int value}) async {
    await loadInstance();
    debugPrint("SET value for shared preferences of key => $key");
    await _prefs.setInt(key, value);
  }

  clearKey({required String key})async{
    await _prefs.remove(key);
    debugPrint("Value of key as been cleared!");
  }

  clearPreferences()async{
    await _prefs.clear();
  }
}