import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const String _authData = 'authData';
  static const _getProfile = 'profile';
  static const String _onBoarding = 'onBoarding';
  static const String _userType = 'user';
  static const String _getDepositeaccount = 'deposit';

  ///
  static const _getPostloan = 'postloan';

//toke
  static Future<void> storeUser(String data) async {
    debugPrint("this is store usertoken $data");
    await saveData(_authData, data);
  }

  static Future<String?> getUser() async {
    return getData(_authData);
  }

  static Future<void> storeUserType(String data) async {
    debugPrint("this is store user $data");
    await saveData(_userType, data);
  }

  static Future<String?> getUserType() async {
    return getData(_userType);
  }

  ///user store profile
  static Future<void> storeProfile(String data) async {
    await saveData(_getProfile, data);
    debugPrint("Stored profile lang data: $data");
  }

  static getProfile() async {
    return getData(_getProfile);
  }

//deposit account
  static Future<void> storedepositaccount(String data) async {
    await saveData(_getDepositeaccount, data);
    debugPrint("Stored depositeaccount lang data: $data");
  }

  static Future<String?> getDepositeaccount() async {
    return getData(_getDepositeaccount);
  }

////store data
  static Future<void> storepostloan(String data) async {
    await saveData(_getPostloan, data);
    debugPrint("Stored Postdeposite lang data: $data");
  }

  static getPostloan() async {
    return getData(_getPostloan);
  }

////
  ///
  ///
  ///

  static Future<bool> storeOnBoarding(bool data) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      debugPrint("Stored onBoarding data: $data");
      return await pref.setBool(_onBoarding, data);
    } catch (e) {
      // debugPrint("Failed to save $_onBoarding data");
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool?> getOnBoarding() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getBool(_onBoarding);
    } catch (e) {
      // debugPrint("Failed to get $_onBoarding data");
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool> saveData(String key, String data) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return await pref.setString(key, data);
    } catch (e) {
      // debugPrint("Failed to save $key data");
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<String?> getData(String key) async {
    // try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(" $key data");
    return pref.getString(key);
    // } catch (e) {
    //   debugPrint("Failed to get $key data");
    //   debugPrint(e);
    //   return null;
    // }
  }

  static Future<void> clear() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  static Future<void> clearAuth() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove(_authData);
      await pref.remove(_getProfile);
      await pref.remove(_userType);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  saveDepositentry() {}
}
