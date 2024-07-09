import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/constant/AppImageDirectory.dart';
import 'package:moneycollection/constant/Button.dart';
import 'package:moneycollection/provider/controller/Profile_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/modules/Deposit/DepositCollection.dart';
import 'package:moneycollection/modules/Loan/LoanCollection.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';


class OtpAuthenticationView extends StatefulWidget {
  final String? email;
  final bool  savingcollect;

  const OtpAuthenticationView({
    super.key,
    this.email, required  this.savingcollect,
  });

  @override
  State<OtpAuthenticationView> createState() => _OtpAuthenticationViewState();
}

class _OtpAuthenticationViewState extends State<OtpAuthenticationView> {
    static const String expectedPin = "12345"; 
     String enteredPin = "";

  late Timer _timer;
  int remainingTime = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  

  
   submitOTP() {
    if (enteredPin == expectedPin) {
      var push = Provider.of<LoanStateProvider>(context, listen: false);
   
      
      (widget.savingcollect == true )
      ? push.depositAccount(context)
      : push.loanAccount(context);

      
    } else {

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Entered PIN is incorrect.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
     return Consumer<ProfileDataProvider>(
          builder: (context, profiledata, child) {
            List<ProfileData> profileDatas = profiledata.ProfileDatas;
    return WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit'),
              content: const Text('Do you want to exit?'),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.logoblueColor, // Set the button's background color
 // Set the button's background color
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(false); // Return false to prevent exiting
                  },
                  child: const Text('No'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors
                        .logoblueColor, // Set the button's background color
                  ),
                  onPressed: () {
                     (widget.savingcollect == true )
                     ?Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DepositCollectionSheet()),
                                )
                                 :Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoanCollectionSheet()),
                                );
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    AppImages.logo,
                    height: 120,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Confirm Pin',
                  style: headingStyle.copyWith(
                    fontSize: 16.sp,
                  )
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'An authentication code have been sent to  ${profileDatas.first.firstName ?? ""}',
                  style: subtitleStyle.copyWith(color: Colors.grey, fontSize: 14.sp),
                ),
                const SizedBox(
                  height: 20,
                ),
                OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  // controller: controller.otpController,
                  fieldWidth: 40,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    // ignore: avoid_print
                    print("Completed: $pin");
                    setState(() {
                        enteredPin = pin;
                    });
                    // controller.getOtp(pin);
                  },
                  onChanged: (v) {},
                ),
                const SizedBox(
                  height: 40,
                ),
     
                
               
                 CustomButtons(
                    label: 'Continue',
                    btnClr: AppColors
                        .logoblueColor,
                    txtClr: Colors.white,
                    ontap: () {
                      print("dd");
        submitOTP();
                      
                    },
                  ),
                
              ],
            ),
          ),
        ));
  }
     );}
}
