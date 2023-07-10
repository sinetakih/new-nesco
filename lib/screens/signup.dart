import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/image/welcome.png'), // Add your logo here
            const SizedBox(height: 20),
            const Text(
              "Sign Up Today",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 10),
            const Text(
              "Let's treat your car right",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBgColor,
                  hintText: 'Your Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBgColor,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBgColor,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBgColor,
                  hintText: 'Confirm password',
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2,
                  width: 164,
                  color: kSecondaryColor,
                ),
                const SizedBox(
                  width: 17,
                ),
                const Text("OR"),
                const SizedBox(
                  width: 17,
                ),
                Container(
                  height: 2,
                  width: 164,
                  color: kSecondaryColor,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("Sign Up With"),
            const SizedBox(
              height: 40,
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                InkWell(child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
