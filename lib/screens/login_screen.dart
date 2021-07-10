import 'package:flutter/material.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/text_theme.dart';
import 'package:spo/shared/utils/field_validator.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(Sizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up', style: Theme.of(context).textTheme.headline4),
                Height(73),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  validator: FieldValidator.validateEmail,
                ),
                Height(8),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _password,
                  validator: FieldValidator.validatePassword,
                ),
                Height(8),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  validator: FieldValidator.validateEmail,
                ),
                Height(16),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                      label: Text('Already have an account? ',
                          style: Theme.of(context).textTheme.subtitle2)),
                ),
                Height(28),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Sign Up"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                      primary: Theme.of(context).primaryColor),
                )
              ],
            )),
      )),
    );
  }
}
