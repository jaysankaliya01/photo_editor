import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker

import 'enhance.dart'; // Make sure the path is correct based on your folder structure

class PhotoEnhancerPage extends StatefulWidget {
  const PhotoEnhancerPage({Key? key}) : super(key: key);

  @override
  _PhotoEnhancerPageState createState() => _PhotoEnhancerPageState();
}

      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('AI Photo Enhancer'),
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
              'Upload your photo, and we\'ll enhance it for you.',
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
                  MaterialPageRoute(builder: (context) => EnhancePhotoPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(
                'Enhance',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
