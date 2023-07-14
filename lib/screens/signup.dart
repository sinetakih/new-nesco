import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/core/enums.dart';
import 'package:nesco/model/auth_models.dart';
import 'package:nesco/screens/signin.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authData, child) {
      return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Image.asset(
                        'assets/image/welcome.png'), // Add your logo here
                    const SizedBox(height: 20),
                    const Text(
                      "Sign Up Today",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),

                    const SizedBox(height: 10),
                    const Text(
                      "Let's treat your car right",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kBgColor,
                        hintText: 'Your Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your username";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kBgColor,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your username";
                        } else if (!value.contains("@")) {
                          return "Please enter a valid email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),

                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kBgColor,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        } else if (value.length < 8) {
                          return "Password should not be less than 8 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),

                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kBgColor,
                        hintText: 'Confirm password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        } else if (value != passwordController.text.trim()) {
                          return "Passwords do not match";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            RegisterRequest credentials = RegisterRequest(
                                password: passwordController.text.trim(),
                                confrimPassword:
                                    confirmPasswordController.text.trim(),
                                email: emailController.text.trim(),
                                username: usernameController.text.trim());
                            await authData
                                .registerWithEmailAndPassword(credentials)
                                .then((value) {
                              if (authData.state == AppState.success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Sucessfully Registered")));
                              } else if (authData.state == AppState.error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(authData.errorMessage ??
                                            "Failed to Register")));
                              }
                            });
                          }
                        },
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
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await authData.signInWithGoogle().then((value) {
                            if (authData.state == AppState.success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Sucessfully Registered")));
                            } else if (authData.state == AppState.error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(authData.errorMessage ??
                                          "Failed to Register")));
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('Sign Up Wih Google'),
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInPage()));
                            },
                            child: Text(
                              " Sign In",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ))
                      ],
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
