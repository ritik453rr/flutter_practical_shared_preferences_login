import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login/login_screen.dart';
import 'package:shared_preferences_login/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home'),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool(SplashScreenState.loginKey, false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child:
              Icon(Icons.home, color: Colors.white.withOpacity(0.5), size: 100),
        ),
      ),
    );
  }
}
