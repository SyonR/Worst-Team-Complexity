import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'third_character_screen.dart'; // Import the ThirdCharacterScreen

class SecondCharacterScreen extends StatefulWidget {
  
  const SecondCharacterScreen({super.key});

  @override
  _SecondCharacterScreenState createState() => _SecondCharacterScreenState();
}

class _SecondCharacterScreenState extends State<SecondCharacterScreen> {
  bool _canNavigate = false;
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();
    // Ensure context is ready before preloading the image
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadImage();
    });
  }

  Future<void> _preloadImage() async {
    try {
      await precacheImage(const AssetImage('images/test2.png'), context);
      if (mounted) {
        setState(() {
          _imageLoaded = true;
        });
      }
    } catch (e) {
      // Handle image loading error
      debugPrint('Error loading image: $e');
    }
  }

  void _onTap() {
    if (_canNavigate) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ThirdCharacterScreen(),
        ),
      );
    } else {
      debugPrint('Cannot navigate yet. Wait for the animation to finish.');
    }
  }
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EAD3),
      body: GestureDetector(
        onTap: _onTap, // Trigger _onTap when the screen is tapped
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageLoaded
                  ? Image.asset(
                      'images/test2.png',
                      width: 200,
                    )
                  : const SizedBox(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(), // Placeholder while loading
                      ),
                    ),
              const SizedBox(height: 50), // Fixed spacing between the image and the text
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: AnimatedTextKit(
                  onFinished: () {
                    setState(() {
                      _canNavigate = true;
                    });
                  },
                  animatedTexts: [
                    TyperAnimatedText(
                      "I will assist you in making good habits and breaking bad ones!",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Courier',
                      ),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}