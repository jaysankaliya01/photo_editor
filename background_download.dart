import 'package:flutter/material.dart';

class BackgroundDownloadPage extends StatelessWidget {
  const BackgroundDownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Remove Background"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text("After"),
                  // Text("Before"),
                ],
              ),
            ),
            Image.asset(
              'assets/images/AllPhoto.png', // Replace with actual image path
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 32),

            // Center the CustomSaveButton here
            CustomSaveButton(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// Custom "Saved To Gallery" button widget
class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 176, 252), // Pink background
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.purpleAccent, width: 2),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Saved To Gallery',
            style: TextStyle(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.check,
            color: Colors.purpleAccent,
          ),
        ],
      ),
    );
  }
}
