import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future setString(String key, String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? '';
  }

  static Future<void> remove(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }
}
