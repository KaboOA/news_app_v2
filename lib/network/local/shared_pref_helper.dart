import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? sharedPrefrences;
  static Future<void> init() async {
    sharedPrefrences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    bool val = false,
  }) {
    return sharedPrefrences!.setBool(key, val);
  }

  static bool getBoolean({required String key}) {
    return sharedPrefrences!.getBool(key) ?? false;
  }
}
