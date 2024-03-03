import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login/home_screen.dart';
import 'package:shared_preferences_login/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Login Screen'),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.blue,
            ),
            //Email
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                label: const Text('Email'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            //Password
            TextField(
              controller: userPasswordController,
              decoration: InputDecoration(
                label: const Text('Password'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            //Submit Button
            ElevatedButton(
              onPressed: () async {
                //successfully logged in
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool(SplashScreenState.loginKey, true);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>const  HomeScreen()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
