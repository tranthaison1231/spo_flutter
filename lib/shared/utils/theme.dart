import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  List<double> strengths = [.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class Palette {
  static final MaterialColor primary =
      createMaterialColor(Color.fromRGBO(27, 27, 108, 1));
  static final MaterialColor secondary =
      createMaterialColor(Color.fromRGBO(243, 193, 25, 1));
  static final MaterialColor tertiary =
      createMaterialColor(Color.fromRGBO(254, 245, 231, 1));
}

class Sizes {
  Sizes._();
  static const double xs = 8;
  static const double sm = 16;
  static const double md = 20;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 40;
}

const textTheme = TextTheme(
    headline4: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40),
    headline5: TextStyle(
        fontFamily: 'Poppins-Bold',
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(27, 27, 108, 1),
        fontSize: 24),
    headline6: TextStyle(
        fontFamily: 'Poppins-Bold',
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(27, 27, 108, 1),
        fontSize: 20),
    subtitle1: TextStyle(
        fontFamily: 'Poppins-Bold',
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(27, 27, 108, 1),
        fontSize: 16),
    subtitle2: TextStyle(
        fontFamily: 'Poppins-Medium',
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(27, 27, 108, 1),
        fontSize: 16),
    bodyText1: TextStyle(
      color: Color.fromRGBO(27, 27, 108, 1),
    ),
    caption: TextStyle(
      fontSize: 16,
      letterSpacing: 0.32,
      color: Color.fromRGBO(170, 172, 174, 1),
    ),
    button: TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins-Bold',
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(27, 27, 108, 1),
    ));

final theme = ThemeData(
    fontFamily: 'Poppins-Regular',
    primarySwatch: Palette.primary,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.secondary,
    ),
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
    ));
