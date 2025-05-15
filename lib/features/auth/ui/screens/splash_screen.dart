import 'package:electro_cart/app/assets_path.dart';
import 'package:electro_cart/features/auth/ui/screens/sign_in_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  _moveToNextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(()=>SignInScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 18.h),
              Image.asset(AssetPath.appLogo),
              Container(
                height: 30.h,
                width: 130.w,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  colors: const [
                    Colors.cyan,
                    Colors.pinkAccent,
                    Colors.deepPurple,
                  ],
                  strokeWidth: 1.h,
                ),
              ),
              SizedBox(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
