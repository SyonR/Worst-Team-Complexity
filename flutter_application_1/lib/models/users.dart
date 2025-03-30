import 'package:shared_preferences/shared_preferences.dart';

class User {
  bool isFirstTime;

  User({required this.isFirstTime});

  // Save user data to SharedPreferences
  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', isFirstTime);
  }

  // Load user data from SharedPreferences
  static Future<User> load() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;
    return User(isFirstTime: isFirstTime);
  }
}