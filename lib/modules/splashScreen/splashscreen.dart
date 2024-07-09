
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppImageDirectory.dart';
import 'package:moneycollection/constant/UserSharepreference.dart';
import 'package:moneycollection/modules/auth/Login.dart';
import 'package:moneycollection/modules/dashboard/dashboard.dart';
import 'package:moneycollection/provider/controller/Profile_state.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:provider/provider.dart';

class ViewSplashScreen extends StatefulWidget {
  const ViewSplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewSplashScreenState();
}

class _ViewSplashScreenState extends State<ViewSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();



  }


  // Function to navigate to the LoginPage after a delay
  void _navigate() {

    
    Future.delayed(const Duration(seconds: 3), () async {
          var loginin = await Preference.getUser();
          print("llam $loginin");
      if(loginin == null){
Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>  const LoginPage())
          
            );
    }else{

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>  const DashboardHome())
          
            );
    }
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: const AssetImage(AppImages.logo),
          fit: BoxFit.fill,
          height: 150.h,
          width: 120.w,
        ),
      ),
    );
  }
}
