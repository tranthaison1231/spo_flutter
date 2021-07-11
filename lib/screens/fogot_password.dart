import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/theme.dart';

class ForgotPassword extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(Sizes.sm),
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forgot Password',
                      style: Theme.of(context).textTheme.headline4),
                  Height(87),
                  Text(
                      'Please, enter your email address. You will receive a link to create a new password via email.'),
                  Height(16),
                  FormBuilderTextField(
                    name: 'email',
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.email(context),
                    ]),
                  ),
                  Height(55),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (_formKey.currentState!.validate()) {
                        print(_formKey.currentState!.value);
                        currentFocus.unfocus();
                      }
                    },
                    child: Text("SEND"),
                  ),
                ],
              ),
            )),
      ),
    ));
  }
}
