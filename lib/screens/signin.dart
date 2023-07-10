import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/screens/homescreen.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/time.png'), // Add your logo here
            const SizedBox(height: 30),
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 12),
            const Text(
              "Please login to your account",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 34),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBgColor,
                  hintText: 'Email or Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBgColor,
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 55,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                InkWell(child: Text(" Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
