import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {


  static const  primaryColor = Color(0xfff01425f);
  static const  greyColor = Color(0xffff8f6f4);

  static const  logopurpleColor =Color(0xfff980BC9);
  static const  logoblueColor =Color(0xfff0066CC);

/*------------------ Colors ----------------*/
  static const primaryLightColor = Color(0xffFFF1DF);
  static const backgroundScaffoldColor = Color(0xffF7F7F7);
  static const secondaryLightColor = Color(0xff874D25);
  static const primaryWhite = Color(0xFFFFFFFF);
  static const borderGreyLight = Color(0xffD1D5DB);
  static const primaryBlack = Color(0xff000000);
  static const buttonGrey = Color(0xff282828);
  static const primaryGolden = Color(0xffF2DFB6);

  // static const primaryGolden = Color(0xffD1D5DB);
  static const primaryGreen = Color(0xff0d7705);
  static const primaryRed = Color(0xffD00C0C);
  static const lightRed = Color(0xffffc9c9);
  static const primaryBrown = Color(0xff3B200F);
  static const primaryGrey = Color(0xff5A5A5A);
  static const lightGrey = Color(0xffF0F0F0);
  static const primaryGoldenLight = Color(0xffFCF9F0);
  static const textColorGolden = Color(0xff6D4021);
  static const primaryBlue = Color(0xff1180a1);

  static const textLightGolden = Color(0xffF9F1DB);
  static const textColorBlack = Color(0xff282828);
  static const primaryYellow = Color(0xffBC933B);
  static const containerColorLight = Color(0xffD1D5DB);
  static const lightGrey2 = Color(0xffF0F0F0);
  static const lightGrey2Border = Color(0xffe4e4e4);
  static const customContainerBorderColor = Color(0xffe0aa57);
  static const customContainerLabelColor = Color(0xffc8c8c8);
  static const servicesContainerColor = Color(0xffbababa);
  static const cartDescriptionColor = Color(0xff979595);
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14.5.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );
}



TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}
