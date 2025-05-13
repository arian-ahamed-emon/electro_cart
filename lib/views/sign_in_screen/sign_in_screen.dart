import 'package:electro_cart/views/home_screen/main_bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../forgot_password_screen/forgot_password_email_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emaillTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 180.h,
              width: 390.w,
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(width: 70.sp),
                  Image.asset(
                    'assets/images/login_l.png',
                    height: 220.h,
                    width: 200.w,
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
                              hintText: 'example@email.com',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('Password:'),
                          const SizedBox(height: 7),
                          TextField(
                            controller: _passwordTEController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '******',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Align(
                            alignment: FractionalOffset.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordEmailScreen(),),);
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.orangeAccent),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                fixedSize: Size(50.w, 30.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainBottomNavigationBarScreen(),), (_) => false);
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Center(child: Text("OR")),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              SocialIcon(
                                icon: FontAwesomeIcons.facebookF,
                                color: Color(0xFF4267B2),
                              ),
                              SocialIcon(
                                icon: FontAwesomeIcons.google,
                                color: Color(0xFFDB4437),
                              ),
                            ],
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

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialIcon({required this.icon, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Icon(icon, color: Colors.white),
    );
  }
}
