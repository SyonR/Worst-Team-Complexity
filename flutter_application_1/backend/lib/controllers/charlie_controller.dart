import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/gemini_service.dart';

class CharlieController {
  final GeminiService _geminiService = GeminiService();

  Router get router {
    final router = Router();

    // Greet the user
    router.get('/greet', (Request request) async {
      print('Received request at /charlie/greet');
      try {
        // Extract the 'prompt' query parameter, or use a default value
        const prompt = "I can't stop vaping.";

        print('Using prompt: $prompt');

        // Call the GeminiService with the prompt
        final response = await _geminiService.getResponse(prompt);
        print(response);
        return Response.ok(response);
      } catch (e) {
        print('Error in /greet route: $e');
        return Response.internalServerError(
          body: 'An error occurred while processing your request: $e',
        );
      }
    });

    return router;
  }
}