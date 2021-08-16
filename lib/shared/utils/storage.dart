import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
  return true;
}

Future<String?> readToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("token");
}
