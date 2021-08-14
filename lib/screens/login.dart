import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:spo/navigation.dart';
import 'package:spo/screens/fogot_password.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/components/social_button.dart';
import 'package:spo/shared/utils/theme.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    void onLogin() async {
      try {
        final form = _formKey.currentState;
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (form!.saveAndValidate()) {
          await Amplify.Auth.signIn(
              username: form.value['email'] as String,
              password: form.value['password'] as String);
          currentFocus.unfocus();
          Get.to(NavigationBar());
        }
      } catch (error) {
        Get.snackbar('Error', error.toString());
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(Sizes.sm),
                child: Column(
                  children: [
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Login',
                              style: Theme.of(context).textTheme.headline4),
                          Height(73),
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
                            validator:
                                FormBuilderValidators.minLength(context, 8),
                          ),
                          Height(16),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton.icon(
                                onPressed: () {
                                  Get.to(ForgotPassword());
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 24,
                                  color: Palette.primary,
                                ),
                                label: Text('Forgot your password? ',
                                    style:
                                        Theme.of(context).textTheme.subtitle2)),
                          ),
                          Height(28),
                          ElevatedButton(
                            onPressed: onLogin,
                            child: Text("LOGIN"),
                          ),
                        ],
                      ),
                    ),
                    Height(194),
                    SocialButtonGroup(title: 'Or login with social account')
                  ],
                )),
          )),
    );
  }
}
