import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:spo/screens/login.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/components/social_button.dart';
import 'package:spo/shared/utils/theme.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    void onSignUp() async {
      try {
        final form = _formKey.currentState;
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (form!.saveAndValidate()) {
          await Amplify.Auth.signUp(
              username: form.value['email'] as String,
              password: form.value['password'] as String,
              options: CognitoSignUpOptions(
                  userAttributes: {'fullName': form.value['name'] as String}));
          currentFocus.unfocus();
          Get.to(Login());
        }
      } catch (error) {
        Get.snackbar('Error', error.toString());
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(Sizes.sm),
            child: Column(
              children: [
                FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign Up',
                          style: Theme.of(context).textTheme.headline4),
                      Height(73),
                      FormBuilderTextField(
                        name: 'name',
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: FormBuilderValidators.required(context),
                      ),
                      Height(8),
                      FormBuilderTextField(
                        name: 'email',
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.email(context),
                        ]),
                      ),
                      Height(8),
                      FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: FormBuilderValidators.minLength(context, 8),
                      ),
                      Height(16),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton.icon(
                            onPressed: () {
                              Get.to(Login());
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 24,
                              color: Palette.primary,
                            ),
                            label: Text('Already have an account? ',
                                style: Theme.of(context).textTheme.subtitle2)),
                      ),
                      Height(28),
                      ElevatedButton(
                        onPressed: onSignUp,
                        child: Text("SIGN UP"),
                      ),
                    ],
                  ),
                ),
                Height(126),
                SocialButtonGroup(
                  title: 'Or sign up with social account',
                  onGooglePress: () {},
                  onFacebookPress: () {},
                )
              ],
            )),
      ),
    ));
  }
}
