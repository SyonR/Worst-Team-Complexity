import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  Credentials? _credentials;
  
  // Optionally, if you want to support custom username/password login,
  // you can add TextEditingControllers here. For the universal login flow,
  // they are not needed.
  
  Future<void> handleLogin() async {
    final credentials = await _authService.login();
    setState(() {
      _credentials = credentials;
    });
    // If login was successful, navigate to HomeScreen
    if (_credentials != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
  
  Future<void> handleLogout() async {
    await _authService.logout();
    setState(() {
      _credentials = null;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: _credentials == null
            ? ElevatedButton(
                onPressed: handleLogin,
                child: const Text("Login with Auth0"),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Logged in as: ${_credentials?.user.email ?? 'Unknown'}"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: handleLogout,
                    child: const Text("Logout"),
                  ),
                ],
              ),
      ),
    );
  }
}