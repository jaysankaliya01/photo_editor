import 'package:flutter/material.dart';
import 'package:photo_editor/forgot_password_page.dart';

import 'profile_page.dart'; // Import the Profile Page (PersonalInfo)
import 'signup.dart'; // Import the SignUpPage

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome back',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please enter your email or phone number & password to sign in.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              'Phone Number or email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Phone Number or email',
                suffixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text('Remember me'),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // Navigate to Profile Page (PersonalInfo) after sign in
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalInfo(),
                    ),
                  );
                },
                child: const Text('Sign in', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to ForgotPasswordPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage(),
                  ),
                );
              },
              child: const Text(
                'Forgot password?',
                style: TextStyle(color: Colors.purple),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Navigate to SignUpPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Center(child: Text('or continue with')),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    width: 48.0,
                    height: 48.0,
                  ),
                  iconSize: 48.0,
                  onPressed: () {},
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.apple),
                  iconSize: 48.0,
                  onPressed: () {},
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.facebook),
                  iconSize: 48.0,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
