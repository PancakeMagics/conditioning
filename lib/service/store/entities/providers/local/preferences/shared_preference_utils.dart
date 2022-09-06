import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  SharedPreferenceUtils._sharedInstance();
  static final SharedPreferenceUtils _shared = SharedPreferenceUtils._sharedInstance();
  factory SharedPreferenceUtils() => _shared;
  SharedPreferences? preferences;


  Future<bool> setPref({required String key, required String value}) async => await preferences!.setString(key, value);
  Future<void> setPrefs({required Map<String, dynamic> data}) async {
    data.forEach((key, value) async => await preferences!.setString(key, value));
  }

  Future<String?> getPref({required String key}) async => await Future(() => preferences!.getString(key));
}