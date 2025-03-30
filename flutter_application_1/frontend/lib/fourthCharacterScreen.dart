import 'package:flutter/material.dart';
import 'fifthCharacterScreen.dart';

class FourthCharacterScreen extends StatefulWidget {
  const FourthCharacterScreen({super.key});

  @override
  _FourthCharacterScreenState createState() => _FourthCharacterScreenState();
}

class _FourthCharacterScreenState extends State<FourthCharacterScreen> {
  final TextEditingController _controller = TextEditingController(); // Capture input

  void _submitResponse() {
    String userInput = _controller.text.trim();

    if (userInput.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FifthCharacterScreen(response: userInput),
        ),
      );
    } else {
      // Show an alert if the user tries to submit an empty response
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Oops!"),
            content: const Text("Please enter a response before submitting."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EAD3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/test.png', // Ensure this is the correct asset path
              width: 200, // Scale image
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Type response here",
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Courier', // Keep the pixel style
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitResponse,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}