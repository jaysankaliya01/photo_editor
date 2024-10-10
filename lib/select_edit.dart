import 'dart:io'; // Import to handle File

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_editor/edit_photo.dart';

class PhotoEditPage extends StatefulWidget {
  const PhotoEditPage({Key? key}) : super(key: key);

  @override
  _PhotoEditPageState createState() => _PhotoEditPageState();
}

class _PhotoEditPageState extends State<PhotoEditPage> {
  final ImagePicker _picker = ImagePicker(); // Create an instance of ImagePicker
  File? _selectedImage; // To store the selected image

  Future<void> _pickImage() async {
    // Open the image picker
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path); // Update the selected image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Photo Editor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Upload your photo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Upload your photo, and Edit.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: _pickImage, // Call the _pickImage method when tapped
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purple[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: _selectedImage == null // Check if an image is selected
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_copy_outlined,
                              size: 48,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Select Photo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      : Image.file(
                          _selectedImage!, // Display the selected image
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: () {
                // Navigate to EditPhotoScreen when the button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPhotoScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
