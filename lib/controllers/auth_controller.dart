import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:get/get.dart';
import 'package:spo/navigation.dart';
import 'package:spo/screens/login.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  Future<SignInResult?> signIn(
      {required String email, required String password}) async {
    try {
      final data =
          await Amplify.Auth.signIn(username: email, password: password);
      if (data.isSignedIn) Get.to(NavigationBar());
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
      Get.to(Login());
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }
}
