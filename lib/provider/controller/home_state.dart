import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  int selectedPeriodIndex = 0;


  

  int selectedScreen = 0;

  

  void onScreenTapped(int index) {
    selectedScreen = index;
    notifyListeners();
  }

  void updateSelectedHoroscopePeriod(int index) {
    selectedPeriodIndex = index;
    notifyListeners();
  }

  bool loading = false;

  /// ------ api call ---*


 

 


}
