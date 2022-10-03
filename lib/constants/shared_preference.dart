import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static final _sharedInstance = Auth._internal();

  Auth._internal();

  static Auth getInstance() {
    return _sharedInstance;
  }

  static final _instance = SharedPreferences.getInstance();

  static final String user_name = "USER_NAME";
  static final String intro_check = "INTRO_CHECK";


  static Future<void> saveUserName(String userName) async {
    final prefs = await _instance;
    prefs.setString(user_name, userName);
  }

  static Future<String?> getUserName() async {
    final prefs = await _instance;
    return prefs.getString(user_name) == null ? "" : prefs.getString(user_name);
  }

  static Future<void> setIsIntroCheck(String introCheck) async {
    final prefs = await _instance;
    prefs.setString(intro_check, introCheck);
  }

  static Future<String?> getIsIntroCheck() async {
    final prefs = await _instance;
    return prefs.getString(intro_check) == null ? "" : prefs.getString(intro_check);
  }
}