import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:spo/screens/signup.dart';
import 'package:spo/screens/sport_selector.dart';
import 'package:spo/shared/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SportSelector(),
      theme: ThemeData(
          fontFamily: 'Poppins-Regular',
          primarySwatch: Palette.primaryColor,
          textTheme: textTheme,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: Size(double.infinity, 48),
            ),
          )),
      darkTheme: ThemeData.dark().copyWith(),
    );
  }
}
