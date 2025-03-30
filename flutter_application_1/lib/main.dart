import 'package:flutter/material.dart';
import '../models/users.dart';
import '../screens/first_character_screen.dart';
import '../screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await User.load(); // Load user data
  runApp(MyApp(user: user));
}

class MyApp extends StatelessWidget {
  final User user;

  const MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: user.isFirstTime
          ? FirstCharacterScreen(user: user)
          : const DashboardScreen(),
    );
  }
}
