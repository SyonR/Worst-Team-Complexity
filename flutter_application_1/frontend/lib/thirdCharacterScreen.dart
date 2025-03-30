import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'fourthCharacterScreen.dart';

class ThirdCharacterScreen extends StatefulWidget {
  const ThirdCharacterScreen({super.key});

  @override
  _ThirdCharacterScreenState createState() => _ThirdCharacterScreenState();
}

class _ThirdCharacterScreenState extends State<ThirdCharacterScreen> {
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
      await precacheImage(const AssetImage('images/test.png'), context);
      setState(() {
        _imageLoaded = true;
      });
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
          builder: (context) => const FourthCharacterScreen(),
        ),
      );
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
              AnimatedOpacity(
                opacity: _imageLoaded ? 1.0 : 0.0, // Fade in the image when loaded
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'images/test.png',
                  width: 200,
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
                      "To start, tell me one bad habit that you’d like to work on.",
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