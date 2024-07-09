import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Postdeposite.dart';
import 'package:moneycollection/constant/UserSharepreference.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:moneycollection/provider/service/services.dart';

class DepositAccountsProvider with ChangeNotifier {
  
  
 
  List<DepositAccounts> accountDepositCollections = [];
  List<DepositAccounts> accountLoanCollections = [];
  List<DepositAccounts> _depositAccounts = [];
  List<DepositAccounts> get depositAccounts => _depositAccounts;

 
  

  Future<void> loadDepositAccountCollections() async {
    List<DepositAccounts> depositaccountcollections =
        await DatabaseHelper.instance.getAlldepositeaccount("DEPOSIT");

    accountDepositCollections = depositaccountcollections;
    notifyListeners();
  }

  Future<void> loadLoanAccountCollections() async {
    List<DepositAccounts> loanaccountcollections =
        await DatabaseHelper.instance.getAlldepositeaccount("LOAN");

    accountLoanCollections = loanaccountcollections;
    notifyListeners();
  }

  int currentIndex = 0;
   changePage(int index) {
    currentIndex = index; 
    notifyListeners();
  }

  Future<void> fetchDepositAccounts() async {
    var token = await Preference.getUser();
    print("token${token}");
    var data = await ApiBaseHelper().getdepositeaccount("${token}");
    print(" This is token ${Preference.getUser()}");
    print("Depositaccount state: fetching the account:${data}");
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    if (data != null) {
      _depositAccounts.clear();

      for (var item in data) {
        var depositAccount = DepositAccounts.fromJson(item);
        _depositAccounts.add(depositAccount);
        await dbHelper.newaccount(depositAccount);
      }
      notifyListeners();
      print('Data received and added to the list');
    } else {
      print('No data received from the server');
    }
  }
}
