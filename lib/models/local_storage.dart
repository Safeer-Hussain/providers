import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<String?> getTheme() async {
    final SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.getString("theme");
  }

  static void setTheme(String theme) async {
    final SharedPreferences prefes = await SharedPreferences.getInstance();
    prefes.setString("theme", theme);
  }
}
