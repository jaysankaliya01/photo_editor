import 'package:flutter/material.dart';
import 'package:photo_editor/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

// First Page with 'Photofy' logo
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    
    // Navigate to SignUpScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular design with the letter 'P'
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 245, 186, 255),
                border: Border.all(
                  color: const Color.fromARGB(255, 194, 12, 255),
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text(
                  'P',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 194, 12, 255),
                    fontFamily: 'Serif', // Optional: Use a serif font
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 'Photofy' Text
            const Text(
              'Photofy',
              style: TextStyle(
                fontSize: 28,
                color: Color.fromARGB(255, 194, 12, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example SignUpScreen
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: const Center(
        child: Text("This is the Sign Up Screen"),
      ),
    );
  }
}
