import 'package:flutter/material.dart';

class DropdownProvider with ChangeNotifier {
  Set<String> _items = {'KTM001', 'KTM002'};

  Set<String> get items => _items;

  void addItem(String value) {
    _items.add(value);
    notifyListeners();
  }

  void removeItem(String value) {
    _items.remove(value);
    notifyListeners();
  }
}