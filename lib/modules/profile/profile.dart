import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/CustomShowDialog.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/constant/AppImageDirectory.dart';
import 'package:moneycollection/constant/UserSharepreference.dart';
import 'package:moneycollection/modules/profile/Information.dart';
import 'package:moneycollection/modules/splashScreen/splashscreen.dart';
import 'package:moneycollection/provider/controller/Profile_state.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:provider/provider.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  String? profileData;
  @override
  void initState() {
    super.initState();
   
    var profiledata =Provider.of<ProfileDataProvider>(context, listen: false);
    profiledata.fetchProfiledata();
     profiledata.loadProfileData();
    profiledata.loadDepositeData();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (context, auuth, child) {
      return Consumer<ProfileDataProvider>(
          builder: (context, profiledata, child) {
        List<ProfileData> profileDatas = profiledata.ProfileDatas;
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.greyColor,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 160.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r)),
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const CustomAppBar(label: 
                      "My Profile",
                      ),
                  Padding(
                    padding: const EdgeInsets.only(top: .0, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 40.r,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(profileDatas
                                            .isEmpty ||
                                        profileDatas.first.profilePhotoUrl ==
                                            null
                                    ? "" // Return an empty string or a placeholder image URL
                                    : "${profileDatas.first.profilePhotoUrl}"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    profileDatas.isEmpty
                                        ? ""
                                        : profileDatas.first.firstName ?? "",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    profileDatas.isEmpty
                                        ? ""
                                        : profileDatas.first.lastName ?? "",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Text(
                                profileDatas.isEmpty
                                    ? ""
                                    : profileDatas.first.email ?? "",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 210.0, left: 20),
                    child: Profiletitle(),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 250.0, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ProfileItems(
                              label: "My Information",
                              sublabel: "View your basic information",
                              imagePath: AppImages.information,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyInformation()),
                                );
                              },
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            ProfileItems(
                              label: "Logout",
                              sublabel: "Logout of this app",
                              imagePath: AppImages.logout,
                              onTap: () {

customShowDialog(
                              context: context,
                              title: "Logout?",
                              content: "Are you sure you want to logout?",
                              onNoPressed: () {
                                Navigator.pop(context);
                              },
                              onYesPressed: () {
                                auuth.signOut();
                              Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ViewSplashScreen()),
);
                              },
                            );
                                
                              },
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}

class ProfileItems extends StatelessWidget {
  final String label;
  final String sublabel;
  final VoidCallback onTap;
  final String imagePath;

  const ProfileItems({
    super.key,
    required this.label,
    required this.sublabel,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8, bottom: 8),
              child: Container(
                height: 25.h,
                width: 25.w,
                color: Colors.white,
                child: Image.asset(imagePath),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    sublabel,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Profiletitle extends StatelessWidget {
  const Profiletitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Basic Information",
      style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.primaryColor,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w600),
    );
  }
}
