import 'package:flutter/material.dart';
import 'first_character_screen.dart';
import '../models/users.dart';


class IntroCharacterScreen extends StatelessWidget {
  final User user;

  const IntroCharacterScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EAD3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset (
              'images/test.png', // Ensure this is the correct asset path
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome to Habit Tracker!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Update the user's first-time status
                user.isFirstTime = false;
                await user.save();

                // Navigate to the dashboard
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstCharacterScreen()),
                );
              },
              child: const Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}