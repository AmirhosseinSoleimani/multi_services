
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  SharedPreferences? _sharedPrefs;

  LocalStorage();

  String? get(String key) => _sharedPrefs?.getString(key);

  Future<bool>? set(String key, String value) => _sharedPrefs?.setString(key, value);

  Future<bool>? remove(String key) => _sharedPrefs?.remove(key);

  Future<bool>? clear() => _sharedPrefs?.clear();

}