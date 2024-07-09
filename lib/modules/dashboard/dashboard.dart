import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/constant/AppImageDirectory.dart';
import 'package:moneycollection/modules/profile/profile.dart';
import 'package:moneycollection/provider/controller/Profile_state.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:moneycollection/modules/Deposit/DepositCollection.dart';
import 'package:moneycollection/modules/Deposit/Depositentry.dart';
import 'package:moneycollection/modules/Loan/LoanCollection.dart';
import 'package:moneycollection/modules/Loan/Loanentry.dart';
import 'package:provider/provider.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  bool isContentVisible = false;
    late dynamic totalDepositValue = 0; 

  void toggleContentVisibility() {
    setState(() {
      isContentVisible = !isContentVisible;
    });
  }
Future<dynamic> _getTotalDeposits() async {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  var total= await databaseHelper.getTotalDeposit();
  print("Today collection:${total}");
  setState(() {
      totalDepositValue = total; // Store the fetched total deposit value
    });
}
  @override
  void initState() {
    super.initState();
var collection = Provider.of<LoanStateProvider>(context, listen: false);
        collection.loadLoanCollections();
        collection.loadSavingCollections();
       var profiledata = Provider.of<ProfileDataProvider>(context, listen: false);
       profiledata.fetchProfiledata();
       profiledata.loadProfileData();


Provider.of<DepositAccountsProvider>(context, listen: false)
        .fetchDepositAccounts();
    LoanStateProvider();
    _getTotalDeposits();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (context, authController, child) {
      return Consumer<ProfileDataProvider>(
          builder: (context, profiledata, child) {
        return Consumer<ThemeModel>(builder: (context, theme, child) {
          return Scaffold(
            backgroundColor: AppColors.greyColor,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r)),
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const DashboardAppBAr(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                          child: Container(
                            height: 600.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 90.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w,
                                        right: 10.w,
                                        top: 10.h,
                                        bottom: 10.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Collected Balance",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            isContentVisible
                                                ?  FirstContent(
                                                  totalDepositValue: totalDepositValue
                                                )
                                                : const SecondContent(),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(isContentVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: toggleContentVisibility,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Dashboardbalance(
                                          width: 150,
                                         imagePath:  AppImages.saving,
                                          text: "Deposit Entry",
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EntryDeposit(
                                                      
                                                      )),
                                            );
                                          },
                                        ),
                                         Dashboardbalance(
                                          width: 150,
                                           imagePath: AppImages.loan,
                                          text: "Loan Entry",
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EntryLoan(
                                                        
                                                      )),
                                            );
                                          },
                                        ),
                                        ],
                                        
                                      ),
                                      SizedBox (height: 20,),
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Dashboardbalance(
                                          width: 150,
                                          imagePath: AppImages.moneycollection,
                                          text: "Deposit Collection ",
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DepositCollectionSheet(
                                                        
                                                      )),
                                            );
                                          },
                                        ),
                                         Dashboardbalance(
                                          width: 150,
                                          imagePath: AppImages.collection,
                                          text: "Loan Collection  ",
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoanCollectionSheet(
                                                        
                                                      )),
                                            );
                                          },
                                        ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),




                                // Padding(
                                //   padding: const EdgeInsets.all(2.0),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Dashboardbalance(
                                //         width: 80,
                                //         imagePath: AppImages.moneycollection,
                                //         text: "Collection",
                                //         onTap: () {
                                //           Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     const Collectionsheets(
                                //                       index: 0,
                                //                     )),
                                //           );
                                //         },
                                //       ),
                                //        Dashboardbalance(
                                //         width: 80,
                                //         imagePath: AppImages.moneycollection,
                                //         text: "Collection",
                                //         onTap: () {
                                //           Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     const Collectionsheets(
                                //                       index: 0,
                                //                     )),
                                //           );
                                //         },
                                //       ),
                                //       Dashboardbalance(
                                //         width: 80,
                                //         imagePath: AppImages.deposit,
                                //         text: "Deposit",
                                //         onTap: () {
                                //           Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     const DepositList()),
                                //           );
                                //         },
                                //       ),
                                //       Dashboardbalance(
                                //         width: 80,
                                //         imagePath: AppImages.loan,
                                //         text: "Loan",
                                //         onTap: () {
                                //           Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     const LoanList()),
                                //           );
                                //         },
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      });
    });
  }
}

class Dashboardbalance extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onTap;
  final double width;
  const Dashboardbalance({
    required this.imagePath,
    required this.text,
    this.onTap,
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    imagePath,
                    width: 40,
                    height: 40,
                    color: AppColors.primaryColor,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardAppBAr extends StatelessWidget {
  const DashboardAppBAr({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (context, authController, _) {
      return Consumer<ProfileDataProvider>(
          builder: (context, profiledata, child) {
        var profiledetails = profiledata.ProfileDatas;
        return Padding(
          padding: EdgeInsets.only(left: 5.0.w, right: 20.w),
          child: Container(
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(5),
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Profileview()),
                    );
                  },
                  child: SizedBox(
                    // Wrap GestureDetector with SizedBox
                    width: 60.w,
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(profiledetails.isEmpty
                          ? ""
                          : "${profiledetails.first.profilePhotoUrl}"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 8.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi Welcome,",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          profiledetails.isEmpty
                              ? ""
                              : profiledetails.first.firstName ?? "",

                          // authController.login.values?["user"]["EMPLOYEENAME"],
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const NotificationPage()),
                //       );
                //     },
                //     child: Padding(
                //       padding: const EdgeInsets.all(2.0),
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10.r),
                //         ),
                //         child: Image.asset(
                //           AppImages.notification,
                //           fit: BoxFit.fill,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      });
    });
  }
}

class FirstContent extends StatelessWidget {
    final dynamic totalDepositValue; 
  const FirstContent({super.key, this.totalDepositValue});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileDataProvider>(
      
          builder: (context, profiledata, child) {
            
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Text(
        "Rs.$totalDepositValue",
        style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.primaryColor,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w900),
      ),
    );
  }
   );
  }
}

class SecondContent extends StatelessWidget {
  const SecondContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Text(
        "Rs.xxxxx",
        style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.primaryBlue,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
