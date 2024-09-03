import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../common/const/log_level.dart';

extension SharedPreferencesX on SharedPreferences {
  Future<bool> setMap(String key, Map<String, dynamic> map) async {
    try {
      final String json = jsonEncode(map);
      return setString(key, json);
    } catch (e) {
      log(e.toString(), level: LogLevel.exception);
      return false;
    }
  }

  Map<String, dynamic>? getMap(String key) {
    try {
      final Map<String, dynamic> json = jsonDecode(getString(key) ?? '');
      return json;
    } catch (e) {
      log(e.toString(), level: LogLevel.exception);
      return null;
    }
  }
}
