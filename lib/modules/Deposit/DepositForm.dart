import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AccountTexfield.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/FormField.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/constant/Utils.dart';
import 'package:moneycollection/constant/calender.dart';
import 'package:moneycollection/provider/controller/Profile_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:provider/provider.dart';

class DepositForm extends StatefulWidget {
  final int index;
  final String accountno;
  final String clientid;
  final String depositecode;
  final String name;

  const DepositForm({
    Key? key,
    required this.index,
    required this.accountno,
    required this.clientid,
    required this.depositecode,
    required this.name,
  }) : super(key: key);

  @override
  State<DepositForm> createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositForm> {
  String selectedDateFormat = 'English';
  @override
  void initState() {
    var loan = Provider.of<LoanStateProvider>(context, listen: false);

    super.initState();
    if (loan.trandatebs.text.isNotEmpty) {
      setState(() {
        initialDate = DateTime.now();
      });
    }

    LoanStateProvider();
  }

  DateTime? initialDate;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = -1;
    return Consumer<LoanStateProvider>(builder: (context, loan, child) {
      return Consumer<ProfileDataProvider>(builder: (context, profile, child) {
        var profiledetails = profile.ProfileDatas;

        loan.accountnumber.text = widget.accountno.substring(7);
        loan.clientid.text = widget.clientid.substring(7);
        loan.depositecode.text = widget.depositecode;
        loan.name.text = widget.name;
        loan.accountnumberadd.text = widget.accountno;
        loan.clientidadd.text = widget.clientid;
        loan.branch.text = widget.accountno.substring(0, 6);

        return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.r),
                            bottomRight: Radius.circular(5.r)),
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const CustomAppBar(
                      label: "Deposit Form",
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70.h, right: 10, left: 10),
                      child: Container(
                        // height: 650.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const DateConversionExample(
                                isSaving:  true,
                              ),
                             
                              const SizedBox(
                                height: 10,
                              ),
                              FormCustomTextField(
                                widget.name,
                                label: "Name",
                                controller: loan.name,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Account Number",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              AccountTextField(
                                  label:
                                      '${profiledetails.isNotEmpty ? profiledetails.first.branchCode ?? "" : ""}-',
                                  controller: loan.accountnumber),
                              const SizedBox(height: 10),
                              Text(
                                "Client ID",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              AccountTextField(
                                  label:
                                      '${profiledetails.isNotEmpty ? profiledetails.first.branchCode ?? "" : ""}-',
                                  controller: loan.clientid),
                              const SizedBox(height: 10),
                              FormCustomTextField(
                                "",
                                label: "Deposite Code",
                                controller: loan.depositecode,
                              ),
                              const SizedBox(height: 10),
                              FormCustomTextField(
                                "0.00",
                                label: "Amount",
                                controller: loan.amount,
                                textInputType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: 10),
                              FormCustomTextField(
                                "",
                                label: "Deposite By",
                                controller: loan.depositeby,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FormCustomTextField(
                                "",
                                label: "Source of Income",
                                controller: loan.sourceIncome,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 100.w, right: 100.w),
                                child: GestureDetector(
                                  onTap: () {
                                    String tranad = loan.trandatead.text;
                                    String tranbs = loan.trandatebs.text;
                                    String accountno = loan.accountnumber.text;
                                    String name = loan.name.text;
                                    String amount = loan.amount.text;
                                    String depositby = loan.depositeby.text;
                                    String sourceIncome =
                                        loan.sourceIncome.text;
                                    String depositecode =
                                        loan.depositecode.text;
                                    String clientid = loan.clientid.text;
                                    String clientidadd = loan.clientidadd.text;
                                    String accountnoadd =
                                        loan.accountnumberadd.text;
                                    String branch = loan.branch.text;
                                    print('tranad: $tranad');
                                    print('tranbs: $tranbs');
                                    print('tranad: $accountno');
                                    print('tranbs: $amount');
                                    print('tranad: $depositby');
                                    print('tranbs: $depositecode');
                                    print('tranad: $clientid');
                                    print('tranad: $name');
                                    print('tranbs: $sourceIncome');
                                    print('tranad: $clientidadd');
                                    print('tranad: $accountnoadd');
                                    print('tranbs: $branch');

                                    if (
                                        // tranad.isEmpty ||
                                        // tranbs.isEmpty ||
                                        accountno.isEmpty ||
                                            name.isEmpty ||
                                            clientid.isEmpty ||
                                            amount.isEmpty ||
                                            depositecode.isEmpty ||
                                            depositby.isEmpty ||
                                            sourceIncome.isEmpty) {
                                      Utilities.showCustomSnackBar(
                                          "Fields are empty");
                                    } else {
                                      loan.databasedeposit(context);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.primaryBlue,
                                    ),
                                    height: 40.h,
                                    child: Center(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 20.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      });
    });
  }
}

class Datename extends StatelessWidget {
  const Datename({
    super.key,
    required this.selectedDateFormat,
  });

  final String selectedDateFormat;

  @override
  Widget build(BuildContext context) {
    print("this is  datetitle:${selectedDateFormat}");
    return Text(
      selectedDateFormat == "English" ? ' (AD)' : ' (BS)',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBrown,
        fontSize: 14.sp,
      ),
    );
  }
}
