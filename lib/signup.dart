import 'package:flutter/material.dart';

import 'otp_page.dart'; // Import the OtpPage
import 'sign_in_page.dart'; // Import the SignInPage

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 100.0),
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Please enter your email or phone number &\npassword to sign up.',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 32.0),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number or email',
                    suffixIcon: Icon(Icons.mail),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email or phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Re-enter Password',
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to the OTP page after successful validation
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OtpPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Set button color to purple
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: const TextStyle(fontSize: 18.0),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('You have an account?'),
                    const SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the SignInPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32.0),
                const Center(child: Text('or continue with')),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset(
                        'assets/images/google_logo.png',
                        width: 48.0, // Specify the same width as the Apple icon
                        height: 48.0, // Specify the same height as the Apple icon
                      ),
                      iconSize: 48.0,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16.0),
                    IconButton(
                      icon: const Icon(Icons.apple), // Replace with Apple logo asset if available
                      iconSize: 48.0,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16.0),
                    IconButton(
                      icon: const Icon(Icons.facebook), // Replace with Facebook logo asset if available
                      iconSize: 48.0,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
