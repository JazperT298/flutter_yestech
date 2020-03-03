
import 'dart:async';
import 'dart:convert';

import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppSharedPreferences {
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferenceKeys.IS_USER_LOGGED_IN);
  }

  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(SharedPreferenceKeys.IS_USER_LOGGED_IN, isLoggedIn);
  }

  static Future<UserEducator> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserEducator.fromJson(
        json.decode(prefs.getString(SharedPreferenceKeys.USER)));
  }

  static Future<void> setUserProfile(UserEducator user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(user);
    return prefs.setString(SharedPreferenceKeys.USER, userProfileJson);
  }

}
