import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:spo/l10n/l10n.dart';
import 'package:spo/screens/login.dart';
import 'package:spo/services/amplify_service.dart';
import 'package:spo/shared/components/loading.dart';
import 'package:spo/shared/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _amplifyConfigured = false;
  Future<void> _configureAmplify() async {
    await AmplifyService.configureAmplify();
    setState(() {
      _amplifyConfigured = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

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
      home: _amplifyConfigured ? Login() : Loading(),
      theme: theme,
      darkTheme: ThemeData.dark().copyWith(),
    );
  }
}
