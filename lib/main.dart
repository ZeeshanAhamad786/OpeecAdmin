import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opeec_admin/view/screens/athentication/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: const LoginScreen(),
        );
      },
    );
  }
}
