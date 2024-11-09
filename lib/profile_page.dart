import 'package:flutter/material.dart';

import 'home_page.dart'; // Import the file where your PhotoEditor class is defined

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  String? selectedGender = ''; // Variable to hold the selected gender value

  @override
  Widget build(BuildContext context) {
    // Get the screen size to manage layout
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Make the content scrollable
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32.0),
                const Text(
                  'Enter personal info',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: CircleAvatar(
                    radius: screenWidth * 0.13, // Adjust the size of CircleAvatar according to the screen width
                    backgroundColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Center(
                  child: Text('Profile Picture'),
                ),
                const SizedBox(height: 32.0),
                const Text('Full Name'),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text('Phone Number'),
                const SizedBox(height: 8.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: '+91 00000 00000',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text('Date of Birth'),
                const SizedBox(height: 8.0),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    hintText: 'MM/DD/YYYY',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text('Gender'),
                const SizedBox(height: 8.0),
                RadioListTile(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  title: const Text('Male'),
                ),
                RadioListTile(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  title: const Text('Female'),
                ),
                RadioListTile(
                  value: 'Other',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  title: const Text('Other'),
                ),
                const SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const PhotoEditor()), // Navigate to PhotoEditor (HomePage) when Skip is clicked
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        minimumSize: const Size(150, 50),
                      ),
                      child: const Text('Skip'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const PhotoEditor()), // Navigate to PhotoEditor (HomePage) when Continue is clicked
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size(150, 50),
                      ),
                      child: const Text('Continue', style: TextStyle(color: Colors.white)),
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
