import 'package:electro_cart/features/home/ui/screens/main_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Success', 'Account created');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Success', 'You are logged in');
      Get.off(()=> MainHomeScreen());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
