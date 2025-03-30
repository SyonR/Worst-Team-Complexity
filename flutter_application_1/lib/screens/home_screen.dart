import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Screen!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Example: Navigate back to login if needed.
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Go Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
