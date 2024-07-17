// lib/controllers/auth_controller.dart
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //static const String AUTH0_DOMAIN = 'dev-z4s5kjlhkkczeqe8.us.auth0.com';
static const String AUTH0_DOMAIN ='otrleasing.us.auth0.com';
  static const String AUTH0_CLIENT_ID = 'sg0FdquHZBxsAq7SjAT2kqNTBKQLbUVt';

  final Auth0 auth0 = Auth0(AUTH0_DOMAIN, AUTH0_CLIENT_ID);

  Rx<Credentials?> credentials = Rx<Credentials?>(null);

  Future<void> loginWithGoogle() async {
    try {
      final result = await auth0.webAuthentication(scheme: 'demo').login(
        parameters: {'connection': 'google-oauth2'},
      );
      credentials.value = result;
    } catch (e) {
      print('Login with Google failed: $e');
    }
  }

  Future<void> loginWithApple() async {
    try {
      final result = await auth0.webAuthentication(scheme: 'demo').login(
        parameters: {'connection': 'apple'},
      );
      credentials.value = result;
    } catch (e) {
      print('Login with Apple failed: $e');
    }
  }

  Future<void> logout() async {
    try {
      await auth0.webAuthentication(scheme: 'demo').logout();
      credentials.value = null;
    } catch (e) {
      print('Logout failed: $e');
    }
  }
}
