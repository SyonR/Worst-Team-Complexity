import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  // Initialize Gemini with your API key
  GeminiService() {
    Gemini.init(apiKey: _apiKey);
  }

  final String _apiKey = 'AIzaSyBkG0BD6sjQw5E5nH5TMz0b8sgLn1mYuOw'; // Replace with your actual API key

  // Send a userPrompt to Gemini and get a response
  Future<String> getResponse(String userPrompt) async {
    try {
      print('Sending request to Gemini API...');
      print('Prompt: $userPrompt');

      // Define Charlie's personality and context
      const systemPrompt = '''You are Charlie, a clueless but highly knowledgeable AI expert in psychology. You speak casually, like a friend giving practical advice. 
      Keep responses short and focused. When asked about a habit, give one actionable tip that directly helps break or build the habit using Atomic Habits principles. 
      Be a little humorous but never off-topic.''';

      // Combine the system userPrompt with the user's userPrompt
      final fullPrompt = '$systemPrompt\n\nUser: $userPrompt\nCharlie:';

      // Use the Gemini instance to send the request
      final response = await Gemini.instance.prompt(parts: [
        Part.text(fullPrompt),
      ]);

      // Log the response
      print('Response received: ${response?.output}');

      // Return the output
      return response?.output ?? 'No response from Gemini API';
    } catch (e) {
      // Log any exceptions
      print('Error occurred while making the request: $e');
      throw Exception('Failed to fetch response from Gemini API: $e');
    }
  }
}