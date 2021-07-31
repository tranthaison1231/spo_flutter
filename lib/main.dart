import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:spo/l10n/l10n.dart';
import 'package:spo/navigation.dart';
import 'package:spo/shared/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: L10n.all,
      locale: Locale('vi'),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: NavigationBar(),
      theme: ThemeData(
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
          )),
      darkTheme: ThemeData.dark().copyWith(),
    );
  }
}
