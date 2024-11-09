import 'package:flutter/material.dart';
import 'package:photo_editor/background_remove.dart';
import 'package:photo_editor/background_download.dart';
import 'package:photo_editor/background_select.dart';
import 'package:photo_editor/enhance_photo.dart';
import 'package:photo_editor/select_edit.dart';
import 'package:photo_editor/setting_page.dart';

class PhotoEditor extends StatefulWidget {
  const PhotoEditor({super.key});

  @override
  State<PhotoEditor> createState() => _PhotoEditorState();
}

class _PhotoEditorState extends State<PhotoEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open Settings Page when menu icon is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
        title: const Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey,
              child: Text(
                'Photo',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space elements evenly
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildButton(
              title: 'Edit Photo',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PhotoEditPage()),
                );
              },
            ),
            _buildButton(
              title: 'Photo Enhance',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PhotoEnhancerPage()),
                );
              },
            ),
            _buildButton(
              title: 'Background Remove',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BackgroundSelectPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required String title, required VoidCallback onTap}) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 186, 255),
        border: Border.all(color: const Color.fromARGB(255, 194, 12, 255)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 194, 12, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 194, 12, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Select Photo',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
