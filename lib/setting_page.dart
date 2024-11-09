import 'package:flutter/material.dart';

import 'signup.dart'; // Make sure the path is correct

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Text(
                    'Photo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email id',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // General Section
            const Text(
              'General',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildMenuItem(
              icon: Icons.person_outline,
              text: 'Personal Info',
              onTap: () {
                // Handle navigation
              },
            ),
            _buildMenuItem(
              icon: Icons.credit_card_outlined,
              text: 'Payment Method',
              onTap: () {
                // Handle navigation
              },
            ),
            _buildMenuItem(
              icon: Icons.security_outlined,
              text: 'Security',
              onTap: () {
                // Handle navigation
              },
            ),
            _buildMenuItem(
              icon: Icons.language_outlined,
              text: 'Language',
              onTap: () {
                // Handle navigation
              },
            ),
            _buildMenuItem(
              icon: Icons.dark_mode_outlined,
              text: 'Dark Mode',
              onTap: () {
                // Handle navigation
              },
            ),
            const SizedBox(height: 30),

            // About Section
            const Text(
              'About',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildMenuItem(
              icon: Icons.share_outlined,
              text: 'Follow us on Social Media',
              onTap: () {
                // Handle navigation
              },
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              text: 'Help Center',
              onTap: () {
                // Handle navigation
              },
            ),
            _buildMenuItem(
              icon: Icons.privacy_tip_outlined,
              text: 'Privacy Policy',
              onTap: () {
                // Handle navigation
              },
            ),
            _buildMenuItem(
              icon: Icons.info_outline,
              text: 'About Photofy',
              onTap: () {
                // Handle navigation
              },
            ),
            const SizedBox(height: 30),

            // Logout Section
            GestureDetector(
              onTap: () {
                // Navigate to the SignUpPage on logout
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()), // Replace SignUpPage with the actual class name from signup.dart
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.logout, color: Colors.redAccent),
                  SizedBox(width: 10),
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.redAccent, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
