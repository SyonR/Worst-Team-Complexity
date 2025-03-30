import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'secondCharacterScreen.dart';


// New Screen to Show the User's Response
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
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Text(
            response.isEmpty ? "No response provided." : response,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Courier',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}