import 'package:auth0_flutter/auth0_flutter.dart';

class AuthService {
  final Auth0 auth0 = Auth0(
    'dev-6bqxodwvh8l3yf5t.us.auth0.com',
    'bhz1fchsCu5VZGhspFPJg13JDnLNVrTt',
  );

  // This method uses Auth0's web authentication (Universal Login)
  Future<Credentials?> login() async {
    try {
      // Opens the Auth0 login page and returns credentials after successful login
      final credentials = await auth0.webAuthentication().login();
      return credentials;
    } catch (e) {
      // Re-throw the exception or handle it as needed
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await auth0.webAuthentication().logout();
    } catch (e) {
      // Handle logout errors if needed
      rethrow;
    }
  }

  // Additional methods for session management, token refresh, etc. can be added here
}
