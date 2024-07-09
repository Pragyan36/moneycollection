import 'package:flutter/material.dart';

import 'package:moneycollection/modules/splashScreen/splashscreen.dart';
import 'package:moneycollection/provider/app_provider.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestStoragePermission();
    await DatabaseHelper.instance.initDatabase();
  runApp(
     DevicePreview(
      enabled: true, 
      builder: (context) => const MyApp(),));
}
Future<void> requestStoragePermission() async {
  PermissionStatus status = await Permission.storage.status;
  if (!status.isGranted) {
    status = await Permission.storage.request();
  }
  if (!status.isGranted) {
    // Handle permission denial
    // You can show a dialog or disable functionality that requires storage access
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: getProviders(),
      child: Consumer<ThemeModel>(
        builder: (context, appTheme, _) {
        return  ScreenUtilInit(
          designSize: const Size(360, 690), // Provide your design size here
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false, 
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const ViewSplashScreen(),
            );
          },
        );
        }
      ),
    );
  }
}

