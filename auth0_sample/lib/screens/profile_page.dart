/*import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_sample/main.dart';
import 'package:auth0_sample/services/authentication_with_social_connection.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Credentials credentials;

  const ProfilePage({super.key, required this.credentials});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserProfile get user => widget.credentials.user;
  String? get name => user.name;
  Uri? get photo => user.pictureUrl;

  void navigateToLoginPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: const SizedBox.shrink(),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(photo.toString()),
              radius: 40,
            ),
            const SizedBox(height: 12),
            Text(
              name ?? 'No name',
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                AuthenticationWithSocialConnections authWithSocials =
                    AuthenticationWithSocialConnections();

                await authWithSocials.signOut();
                navigateToLoginPage();
              },
              child: const Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}*/
// lib/views/profile_view.dart

import 'package:auth0_sample/services/connections/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final credentials = authController.credentials.value!;
    final user = credentials.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: const SizedBox.shrink(),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.pictureUrl.toString()),
              radius: 40,
            ),
            const SizedBox(height: 12),
            Text('User Name: ${user.name} '?? 'No name'),
            const SizedBox(height: 12),
            Text('User ID: ${user.sub}'),
            const SizedBox(height: 12),
            Text('User Email: ${user.email}'),
            const SizedBox(height: 12,),
            //Text(credentials.accessToken),
           // Text("User Birth Date: ${user.name}"),
            ElevatedButton(
              onPressed: authController.logout,
              child: Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
