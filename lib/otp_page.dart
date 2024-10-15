import 'package:flutter/material.dart';
import 'sign_in_page.dart'; // Import the SignInPage

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _submitOtp() {
    String enteredOtp = _otpControllers.map((controller) => controller.text).join();
    if (enteredOtp.length == 6) {
      // Log the entered OTP (for demo purposes, you can replace this with your verification logic)
      print('Entered OTP: $enteredOtp');

      // Navigate to the SignInPage after entering OTP
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    } else {
      // Show a message if OTP is incomplete
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a complete OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please enter OTP to create account.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'OTP',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _otpControllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "", // Hide the counter for character length
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).nextFocus(); // Move to the next field
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus(); // Move back if empty
                      }

                      if (index == 5 && value.isNotEmpty) {
                        _submitOtp(); // Submit OTP when the last digit is entered
                      }
                    },
                    onSubmitted: (value) {
                      if (index == 5) {
                        _submitOtp(); // Submit OTP when the last field is submitted
                      }
                    },
                  ),
                );
              }),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _submitOtp, // Manually submit OTP
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: const Text(
                'Enter',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
