import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/constant/UserSharepreference.dart';
import 'package:moneycollection/provider/service/services.dart';

class ProfileDataProvider with ChangeNotifier {
  String? profileData;
  Future<void> loadProfileData() async {
    String? data = await Preference.getProfile();

    profileData = data;
    print(" Profile page :Profile data load from preference: ${profileData}");
    notifyListeners();
  }

  Future<void> loadDepositeData() async {
    String? data = await Preference.getDepositeaccount();

    profileData = data;
    print("Profile page: Deposit account load from preference:${profileData}");
    notifyListeners();
  }

  List<ProfileData> _profiledata = [];

  List<ProfileData> get ProfileDatas => _profiledata;

  Future<void> fetchProfiledata() async {
    var token = await Preference.getUser();

    var data = await ApiBaseHelper().getprofiledetails("$token");

    if (data != null) {
      _profiledata.clear();

      ProfileData profile = ProfileData.fromJson(data);
      _profiledata.add(profile);

      String jsonData = json.encode(data);

      Preference.storeProfile(jsonData);

      notifyListeners();
      print('Data received and added to the list');
    } else {
      print('No data received from the server');
    }
  }
}
