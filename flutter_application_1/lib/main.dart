import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // Import the login screen
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App', // Set the title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color of the app
      ),
      home: const LoginScreen(), // Set the login screen as the home screen
      onGenerateRoute: (settings) {
        // Define named routes and handle navigation
        if (settings.name == '/home') {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}