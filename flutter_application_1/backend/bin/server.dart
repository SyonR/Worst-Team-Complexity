import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:backend/controllers/charlie_controller.dart';
import 'package:shelf_router/shelf_router.dart'; // Import shelf_router for Router and mount

void main() async {
  // Combine all routes from controllers
  final handler = Pipeline()
      .addMiddleware(logRequests()) // Log all requests
      .addHandler(_router.call);

  // Start the server
  final server = await io.serve(handler, InternetAddress.anyIPv4, 8080);
  print('Server listening on port ${server.port}');
}

Router get _router {
  final router = Router();

  // Root route
  router.get('/', (Request request) {
    return Response.ok('Welcome to the Charlie Backend!');
  });

  // Charlie routes
  router.mount('/charlie/', CharlieController().router.call);

  return router;
}

