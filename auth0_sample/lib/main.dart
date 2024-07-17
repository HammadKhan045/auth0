/*import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_sample/screens/profile_page.dart';
import 'package:auth0_sample/services/connections/sign_in_with_apple.dart';
import 'package:auth0_sample/services/connections/sign_in_with_google.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void navigateToUserProfile(Credentials credentials) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          credentials: credentials,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                SignInWithApple signInWithApple = SignInWithApple();

                final credentials = await signInWithApple.signIn();
                navigateToUserProfile(credentials);
              },
              child: const Text('Sign in with Apple'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  SignInWithGoogle signInWithGoogle = SignInWithGoogle();
                  final credentials = await signInWithGoogle.signIn();
                  navigateToUserProfile(credentials);
                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}*/
// lib/main.dart
import 'package:auth0_sample/screens/profile_page.dart';
import 'package:auth0_sample/services/connections/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth0 Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
class LoginView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Obx(() {
          if (authController.credentials.value == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: authController.loginWithApple,
                  child: const Text('Sign in with Apple'),
                ),
                ElevatedButton(
                  onPressed: authController.loginWithGoogle,
                  child: const Text('Sign in with Google'),
                ),
              ],
            );
          } else {
            return ProfileView();
          }
        }),
      ),
    );
  }
}
