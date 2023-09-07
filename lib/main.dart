import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/routes/AppRoutes.dart';
import 'controller/network_controller.dart';

void main() {
  runApp(const MyApp());
  Get.put<NetworkController>(NetworkController(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins',
      textTheme: TextTheme(
         bodyText2: TextStyle(
            fontSize: 14.0, // Adjust the font size as needed
          ),
      )),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
    );
  }
}
