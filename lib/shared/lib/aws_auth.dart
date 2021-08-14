import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

class AWSAuth {
  Future<AuthUser?> get user async {
    try {
      final currentUser = await Amplify.Auth.getCurrentUser();
      return currentUser;
    } catch (e) {
      return null;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      final CognitoSignUpOptions options =
          CognitoSignUpOptions(userAttributes: {'email': email});
      await Amplify.Auth.signUp(
          username: email, password: password, options: options);
    } on Exception {
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await Amplify.Auth.signIn(username: email, password: password);
    } on Exception {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } on Exception {
      rethrow;
    }
  }
}
