import 'package:electro_cart/views/home_screen/main_bottom_navigation_bar_screen.dart';
import 'package:electro_cart/views/home_screen/main_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/sign_in_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Electro Cart',
          home: SplashScreen(),
        );
      },
    );
  }
}
