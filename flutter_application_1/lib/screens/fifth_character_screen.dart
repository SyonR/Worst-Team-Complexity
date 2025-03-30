import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import AnimatedTextKit
import 'dashboard_screen.dart'; // Import DashboardScreen

class FifthCharacterScreen extends StatelessWidget {
  final String response;

  const FifthCharacterScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EAD3),
      appBar: AppBar(
        title: const Text("Your Response"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add the image
            Image.asset(
              'images/test.png', // Replace with your image path
              width: 200,
            ),
            const SizedBox(height: 20), // Add spacing between the image and the text
            // Add the animated text
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    response.isEmpty
                        ? "No response provided."
                        : "Would you like to work on breaking this bad habit: $response?",
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Courier',
                    ),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),
            const SizedBox(height: 30), // Add spacing between the text and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Use Navigator.pop to return to FourthCharacterScreen
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button color
                  ),
                  child: const Text("No"),
                ),
                const SizedBox(width: 20), // Add spacing between the buttons
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the DashboardScreen when "Yes" is pressed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen, // Button color
                  ),
                  child: const Text("Yes"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}