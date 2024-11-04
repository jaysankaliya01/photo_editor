import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker
import 'package:photopy/background_remove.dart';

class BackgroundSelectPage extends StatefulWidget {
  const BackgroundSelectPage({Key? key}) : super(key: key);

  @override
  _BackgroundSelectPageState createState() => _BackgroundSelectPageState();
}

class _BackgroundSelectPageState extends State<BackgroundSelectPage> {
  final ImagePicker _picker = ImagePicker(); // Create an instance of ImagePicker
  XFile? _image; // Variable to hold the selected image

  Future<void> _selectPhoto() async {
    // Pick an image from the gallery
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile; // Set the selected image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Background remover'),
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
              'Upload your photo, and remove background.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: _selectPhoto, // Call the image picker on tap
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purple[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_copy_outlined,
                        size: 48,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Select Photo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: () {
                // Navigate to EnhancePage when the button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RemoveBackgroundPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(
                'Remove',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
