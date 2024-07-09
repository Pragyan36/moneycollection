
import 'package:flutter/material.dart';
import 'package:moneycollection/constant/AppColors.dart';


class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;

  void toggleTheme() {
    currentTheme = (currentTheme == lightTheme) ? darkTheme : lightTheme;
    print(currentTheme);
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  primaryColor: AppColors.primaryWhite,
  primaryColorLight: AppColors.primaryWhite,
  scaffoldBackgroundColor: AppColors.backgroundScaffoldColor,
  cardColor: AppColors.primaryGolden,
  navigationBarTheme:
      const NavigationBarThemeData(backgroundColor: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    // Label text color
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.lightGrey),
      borderRadius: BorderRadius.circular(10.0), // Border color when focused
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.lightGrey),
      borderRadius:
          BorderRadius.circular(10.0), // Border color when not focused
    ),
    // Add more customizations as needed
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    buttonColor: Colors.black,
    disabledColor: Colors.grey,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 24.0,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 72.0,
      color: AppColors.primaryBlack,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    titleLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    titleSmall: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryBlack,
      fontFamily: 'Inter',
    ),
    titleMedium: const TextStyle(
      fontSize: 18.0,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      color: AppColors.primaryBlack,
    ),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w300,
        color: AppColors.primaryBlack.withOpacity(0.8)),
    displayMedium: const TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryBlack,
      fontFamily: 'Inter',
    ),
    displaySmall: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryBlack,
      fontFamily: 'Inter',
    ),
    headlineMedium: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryBlack,
      fontFamily: 'Inter',
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryBlack,
      fontFamily: 'Inter',
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryBlack,
      fontFamily: 'Inter',
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      color: AppColors.primaryBlack,
      fontWeight: FontWeight.normal,
      fontFamily: 'Inter',
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryBlack,
      fontFamily: 'Inter',
    ),
    labelSmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryBlack,
      fontFamily: 'Inter',
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: ThemeData.light().scaffoldBackgroundColor,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: AppColors.primaryBlack),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.primaryBrown,
    // Customize the selected item color
    unselectedItemColor: AppColors.primaryBrown,
    // Customize the unselected item color
    backgroundColor: Colors.white,
    // Customize the background color
    elevation: 5,
    // Customize the elevation
    showSelectedLabels: true,
    // Show labels for the selected items
    showUnselectedLabels: true,
    // Show labels for the unselected items
    selectedIconTheme: IconThemeData(size: 30),
    // Customize the selected icon size
    unselectedIconTheme:
        IconThemeData(size: 24), // Customize the unselected icon size
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  inputDecorationTheme: const InputDecorationTheme(
    // Label text color
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.primaryWhite), // Border color when focused
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryWhite),
      // Border color when not focused
    ),
    // Add more customizations as needed
  ),
  cardColor: ThemeData.dark().scaffoldBackgroundColor,
  primaryColorLight: ThemeData.dark().primaryColorLight,
  primaryColor: AppColors.primaryBrown,
  canvasColor: ThemeData.dark().canvasColor,

  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    disabledColor: Colors.grey,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.primaryWhite,
    size: 24.0,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      color: AppColors.primaryWhite.withOpacity(0.8),
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    titleLarge: TextStyle(
      fontSize: 20.0,
      color: AppColors.primaryWhite.withOpacity(0.8),
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: AppColors.primaryWhite.withOpacity(0.5),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Inter',
      color: AppColors.primaryWhite.withOpacity(0.8),
    ),
    displayMedium: TextStyle(
      fontSize: 60.0,
      color: AppColors.primaryWhite.withOpacity(0.8),
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    displaySmall: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      color: AppColors.primaryWhite.withOpacity(0.8),
    ),
    headlineMedium: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      color: AppColors.primaryWhite.withOpacity(0.8),
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      color: AppColors.primaryWhite.withOpacity(0.8),
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Inter',
      color: AppColors.primaryWhite,
    ),
    bodyLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryWhite,
      fontFamily: 'Inter',
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryWhite,
      fontFamily: 'Inter',
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryWhite.withOpacity(0.8),
      fontFamily: 'Inter',
    ),
    labelSmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Inter',
      color: AppColors.primaryWhite.withOpacity(0.8),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      titleTextStyle: const TextStyle(color: AppColors.primaryWhite)),
  bottomAppBarTheme: const BottomAppBarTheme(),
  // backgroundColor: _themeClass.primaryBlue, // Set background color here
  colorScheme: const ColorScheme.dark().copyWith(
    primary: AppColors.primaryLightColor,
    background: AppColors.primaryLightColor,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.indigo,
    unselectedLabelColor: Colors.grey,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    // Customize the selected item color
    unselectedItemColor: AppColors.primaryGrey,
    // Customize the unselected item color
    backgroundColor: Colors.white,
    // Customize the background color
    elevation: 5,
    // Customize the elevation
    showSelectedLabels: true,
    // Show labels for the selected items
    showUnselectedLabels: true,
    // Show labels for the unselected items
    selectedIconTheme: IconThemeData(size: 20),
    // Customize the selected icon size
    unselectedIconTheme:
        IconThemeData(size: 20), // Customize the unselected icon size
  ),
);
