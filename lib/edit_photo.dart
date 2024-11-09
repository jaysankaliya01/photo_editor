import 'package:flutter/material.dart';
import 'package:photo_editor/adjust.dart';  // Corrected typo
import 'package:photo_editor/colorizer.dart';
import 'package:photo_editor/crop.dart';
import 'package:photo_editor/edit_download.dart';
import 'package:photo_editor/filter.dart';

class EditPhotoScreen extends StatelessWidget {
  const EditPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Edit Photo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              // Navigate to the EditPhotoDownload page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  EditPhotoDownloadScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assetsimages/AllPhoto.png', // Replace with the actual image path
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEditOption(
                  Icons.brightness_4,
                  'Adjust',
                  onTap: () {
                    // Navigate to the AdjustPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  AdjustPage()),
                    );
                  },
                ),
                _buildEditOption(
                  Icons.color_lens,
                  'Colorizer',
                  onTap: () {
                    // Navigate to the ColorizerPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ColorizerPage()),
                    );
                  },
                ),
                _buildEditOption(
                  Icons.crop,
                  'Crop',
                  onTap: () {
                    // Navigate to the CropPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  CropPage()),
                    );
                  },
                ),
                _buildEditOption(
                  Icons.filter_list,
                  'Filters',
                  onTap: () {
                    // Navigate to the FilterPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditOption(IconData icon, String label, {Function()? onTap}) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onTap,
        ),
        Text(label),
      ],
    );
  }
}
