import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/constant/AppImageDirectory.dart';
import 'package:moneycollection/constant/Nodata.dart';
import 'package:moneycollection/modules/Collection/loancollection.dart';
import 'package:moneycollection/modules/Loan/loancollectionlist.dart';
import '../Collection/table.dart';
import 'package:moneycollection/modules/dashboard/dashboard.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/modules/Collection/pin.dart';
import 'package:provider/provider.dart';

class LoanCollectionSheet extends StatefulWidget {
  
  const LoanCollectionSheet({super.key});

  @override
  State<LoanCollectionSheet> createState() => _LoanCollectionSheetState();
}

class _LoanCollectionSheetState extends State<LoanCollectionSheet> {
  void initState() {
    super.initState();

  
    var collection = Provider.of<LoanStateProvider>(context, listen: false);
    
    collection.loadLoanCollections();
 
 
  
  }
  @override
  Widget build(BuildContext context) {
     return Consumer<LoanStateProvider>(
        builder: (context, loanacc, child) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                      color: AppColors.primaryBlue,
                    ),
                  ),
                   Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardHome()),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Loan Collection Sheet", 
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
               Padding(
                 padding: const EdgeInsets.only(top: 70.0, left: 10,right: 10),
                 child: Container(
                  color: Colors.white,
                   child: Column(
                     children: [
                       Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15, left: 20),
                              child: Center(
                                child: Text(
                                  " Loan Collection Sheet",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Consumer<LoanStateProvider>(
                                        builder: (context, loan, child) {
                                      return AlertDialog(
                                        title: const Text("Confirm Pushing"),
                                        content: const Text(
                                            "Are you sure you want to push the  Deposit Collection?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OtpAuthenticationView(
                savingcollect: false,
              )),
            );
                                            },
                                            
                                            child: const Text("Push"),
                                          ),
                                        ],
                                      );
                                    });
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: 20.h,
                                    width: 20.h,
                                    color: Colors.white,
                                    child: Image.asset(
                                      AppImages.sync,
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                        ],
                                     ),
                                     loanacc.loancollectionsheet .isEmpty
                  ? const Nodata()
                  : Column(
                      children: [
                        TableHeaderRow(),
                        SizedBox(
                            height: 425.h, child: const Loancoll()),
                      ],
                    )
                     ],
                   ),
                 ),
               ),
                 
                  
                  ],
          ),
        ),
      ),

    );
  }
  );
  }
}