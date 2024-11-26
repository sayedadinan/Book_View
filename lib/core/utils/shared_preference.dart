import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  // Initialize the SharedPreferences instance
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save token synchronously
  static void saveToken(String token) {
    _preferences?.setString('auth_token', token);
  }

  // Retrieve token synchronously
  static String? get token => _preferences?.getString('auth_token');
}
