import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationService<T> {
  Auth0 auth0 = Auth0(
    'dev-z4s5kjlhkkczeqe8.us.auth0.com', //auth0 domain
    'mJZfgM2wJtQJnl61zmmq6GyEUMFEqUFi',
  );

  Future<T> signIn();

  Future<void> signOut();
}

enum SocialConnection {
  apple('apple'),
  google('google-oauth2');

  final String getName;

  const SocialConnection(this.getName);
}

class AuthenticationWithSocialConnections
    extends AuthenticationService<Credentials> {
  SocialConnection get connection {
    throw UnimplementedError('connection getter must be implemented');
  }

  @override
  Future<Credentials> signIn() async {
    try {
      Credentials response =
          await auth0.webAuthentication(scheme: 'demo').login(
        parameters: {'connection': connection.getName},
      );

      if (kDebugMode) {
        print(response.accessToken);
      }
      return response;
    } catch (e) {
      if (!kReleaseMode) {
        debugPrint(e.toString());
      }
      throw Exception();
    }
  }

  @override
  Future<void> signOut() async {
    await auth0.webAuthentication(scheme: 'demo').logout();
  }
}
class SignInWithGoogle extends AuthenticationWithSocialConnections {
  @override
  SocialConnection get connection => SocialConnection.google;
}

class SignInWithApple extends AuthenticationWithSocialConnections {
  @override
  SocialConnection get connection => SocialConnection.apple;
}