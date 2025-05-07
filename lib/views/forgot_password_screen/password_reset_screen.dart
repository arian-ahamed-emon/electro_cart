import 'package:electro_cart/views/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() =>
      _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  TextEditingController _emaillTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 180.h,
              width: 390.w,
              decoration: BoxDecoration(color: Colors.amberAccent),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(width: 28.sp),
                  Image.asset(
                    'assets/images/create_password.png',
                    height: 200.h,
                    width: 180.w,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text('Email:'),
                          const SizedBox(height: 7),
                          TextField(
                            controller: _emaillTEController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ), const SizedBox(height: 10),
                          TextField(
                            controller: _emaillTEController,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amberAccent,
                                fixedSize: Size(50.w, 30.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => SignInScreen(),
                                  ),
                                    (_) => false
                                );
                              },
                              child: const Text(
                                "Confirm",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

