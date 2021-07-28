import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:spo/navigation.dart';
import 'package:spo/shared/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBar(),
      theme: ThemeData(
          fontFamily: 'Poppins-Regular',
          primarySwatch: Palette.primary,
          textTheme: textTheme,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Palette.secondary,
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            shape: CircularNotchedRectangle(),
          ),
          bottomSheetTheme: BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
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
