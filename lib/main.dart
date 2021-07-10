import 'package:flutter/material.dart';
import 'package:spo/screens/login_screen.dart';
import 'package:spo/shared/utils/text_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: ThemeData(
          fontFamily: 'Poppins-Regular',
          primaryColor: Color.fromRGBO(27, 27, 108, 1),
          accentColor: Color.fromRGBO(243, 193, 25, 1),
          textTheme: textTheme,
        ));
  }
}
