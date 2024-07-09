import 'dart:io';

import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Postdeposite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  //create a db client
  static final DatabaseHelper instance = DatabaseHelper._();
  DatabaseHelper._();


  //setup database
static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
  // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(await getDatabasesPath(), 'postcollection.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){

      },
      onCreate: ( Database db, int version)async{
       await db.execute("CREATE TABLE POSTSAVINGCOLLECTION("
       "ACCOUNT PRIMARY KEY ,"
       "BRANCHCODE TEXT NOT NULL,"
       "CUSTID TEXT NOT NULL,"
       "DEPOSITCODE TEXT NOT NULL,"
       "tran_date_ad TEXT NOT NULL,"
       "tran_date_bs TEXT NOT NULL,"
       "CUSTOMERNAME TEXT NOT NULL,"
       "DEPOSIT TEXT NOT NULL"
       ")");
         await db.execute("CREATE TABLE POSTLOANCOLLECTION("
       "ACCOUNT PRIMARY KEY,"
       "BRANCHCODE TEXT NOT NULL,"
        "CUSTID TEXT NOT NULL,"
       "DEPOSITCODE TEXT NOT NULL,"
       "tran_date_ad TEXT NOT NULL,"
       "tran_date_bs TEXT NOT NULL,"
       "CUSTOMERNAME TEXT NOT NULL,"
       "DEPOSIT TEXT NOT NULL"
       ")");
      await db.execute("CREATE TABLE ACCOUNTS("
       "ACCOUNT TEXT NOT NULL PRIMARY KEY,"
       "CUSTID TEXT NOT NULL,"
       "CUSTOMERNAME TEXT NOT NULL,"
       "MOBILE TEXT NOT NULL,"
       "BAL REAL ,"
       "DEPOSITTYPE TEXT NOT NULL,"
       "DEPOSITCODE TEXT NOT NULL,"
       "TYPE TEXT NOT NULL"
       ")");
      },
    );
  }
///POST SAVING COLLECTION
newsavingcollection(Entries newEntries) async {
  final db = await database;

  var existingAccounts = await db.query("POSTSAVINGCOLLECTION", where: "ACCOUNT = ?", whereArgs: [newEntries.aCCOUNT]);
  if (existingAccounts.isNotEmpty) {
  
    print("Duplicate entry: ${existingAccounts.first}");
    return "Duplicate entry"; 
  }

  var res = await db.insert("POSTSAVINGCOLLECTION", newEntries.toJson());

  if (res != -1) {
    print("Data inserted successfully with ID: $res");
    var insertedData = await db.query("POSTSAVINGCOLLECTION", where: "ACCOUNT = ?", whereArgs: [res]);
    if (insertedData.isNotEmpty) {
      print("Inserted Data: ${insertedData.first}");
    } else {
      print("Failed to fetch inserted data");
    }
    return "Data inserted successfully"; 
  } else {
    print("Failed to insert data");
    return "Failed to insert data"; 
  }
}
  getsavingcollection(String  account) async {
    final db = await database;
    var res =await  db.query("POSTSAVINGCOLLECTION", where: "ACCOUNT = ?", whereArgs: [account]);
    return res.isNotEmpty ? Entries.fromJson(res.first) : Null ;
  }

  getAllgetsavingcollection() async {
  final db = await database;
  var res = await db.query("POSTSAVINGCOLLECTION");
  print("All Saving Collection Data: $res"); // Print the data
  List<Entries> list =
      res.isNotEmpty ? res.map((c) => Entries.fromJson(c)).toList() : [];
  return list;
}


Future<int> updateAmount(String account, String newAmount) async {
  final db = await database;
  return await db.update(
    "POSTSAVINGCOLLECTION",
    {"DEPOSIT": newAmount},
    where: "account = ?",
    whereArgs: [account],
  );
}
   deletesavingcollection(String account) async {
    final db = await database;
    db.delete("POSTSAVINGCOLLECTION", where: "account = ?", whereArgs: [account]);
  }

  ///LOAN COLLECTION
   newloancollection(Entries newEntries) async {
    final db = await database;
    var existingAccounts = await db.query("POSTLOANCOLLECTION", where: "ACCOUNT = ?", whereArgs: [newEntries.aCCOUNT]);
  if (existingAccounts.isNotEmpty) {
    // Account already exists, handle the situation accordingly
    print("Only Savinng collection can insert on time: ${existingAccounts.first}");
    return -1; // Return a negative value to indicate failure
  }
    var res = await db.insert("POSTLOANCOLLECTION", newEntries.toJson());
    return res;
  }

  getloancollection(String account) async {
    final db = await database;
    var res =await  db.query("POSTLOANCOLLECTION", where: "account = ?", whereArgs: [account]);
    return res.isNotEmpty ? Entries.fromJson(res.first) : Null ;
  }

  getAllgetloancollection() async {
    final db = await database;
    var res = await db.query("POSTLOANCOLLECTION");
    List<Entries> list =
        res.isNotEmpty ? res.map((c) => Entries.fromJson(c)).toList() : [];
    return list;
  }
Future<int> updateloancollection(String account, String newAmount) async {
  final db = await database;
  return await db.update(
    "POSTLOANCOLLECTION",
    {"DEPOSIT": newAmount},
    where: "account = ?",
    whereArgs: [account],
  );
}

deleteloancollection(String account) async {
    final db = await database;
    db.delete("POSTLOANCOLLECTION", where: "account = ?", whereArgs: [account]);
  }




Future<dynamic> getTotalDeposit() async {
  var totalDeposit;


  final Database db = await openDatabase('postcollection.db');


  final savingCollectionResult = await db.rawQuery('SELECT SUM(DEPOSIT) AS total FROM POSTSAVINGCOLLECTION');

  final loanCollectionResult = await db.rawQuery('SELECT SUM(DEPOSIT) AS total FROM POSTLOANCOLLECTION');

  final savingCollectionDeposit = savingCollectionResult.isNotEmpty ? savingCollectionResult.first['total']?? 0 : 0;

  final loanCollectionDeposit = loanCollectionResult.isNotEmpty ? loanCollectionResult.first['total'] ?? 0: 0;


  
  if (savingCollectionDeposit is num && loanCollectionDeposit is num) {
    totalDeposit = savingCollectionDeposit + loanCollectionDeposit;
  } else {

    totalDeposit = null;
  }


  return totalDeposit;
}


//account
newaccount(DepositAccounts newAccount) async {
  final db = await database;
//dublicate data
var existingAccounts = await db.query("ACCOUNTS", where: "ACCOUNT = ?", whereArgs: [newAccount.aCCOUNT]);
  if (existingAccounts.isNotEmpty) {
    // Account already exists, handle the situation accordingly
    print("Account already exists: ${existingAccounts.first}");
    return -1; // Return a negative value to indicate failure
  }
  


  var res = await db.insert("ACCOUNTS", newAccount.toJson());
  if (res != -1) {
    print("Data inserted successfully with ID: $res");
    // Fetch the inserted data
    var insertedData = await db.query("ACCOUNTS", where: "ACCOUNT = ?", whereArgs: [res]);
    if (insertedData.isNotEmpty) {
      print("Inserted Data: ${insertedData.first}");
    
    } else {
      print("Failed to fetch inserted data");
    }
  } else {
    print("Failed to insert data");
  }
  return res;
}
  getaccount(String ACCOUNT) async {
    final db = await database;
    var res =await  db.query("ACCOUNTS", where: "ACCOUNT = ?", whereArgs: [ACCOUNT]);
    return res.isNotEmpty ? DepositAccounts.fromJson(res.first) : Null ;
  }

 Future<List<DepositAccounts>> getAllgetaccount() async { 
  final db = await database;
  var res = await db.query("ACCOUNTS");
  print(res);
  List<DepositAccounts> list = 
  res.isNotEmpty ? res.map((c) => DepositAccounts.fromJson(c)).toList() : [];
  return list;
}
  Future<List<DepositAccounts>>getAlldepositeaccount(String type) async {
  final db = await database;
  var res = await db.query("ACCOUNTS", where: "TYPE = ?", whereArgs: [type]);
  List<DepositAccounts> list = 
  res.isNotEmpty ? res.map((c) => DepositAccounts.fromJson(c)).toList() : [];
  return list;
}
//   updateaccount(DepositAccounts newAcccount) async {
//     final db = await database;
//     var res = await db.update("ACCOUNTS", newAcccount.toJson(),
//         where: "id = ?", whereArgs: [newAcccount]);
//     return res;
//   }
// deleteaccount(int id) async {
//     final db = await database;
//     db.delete("ACCOUNTS", where: "id = ?", whereArgs: [id]);
//   }

  

}