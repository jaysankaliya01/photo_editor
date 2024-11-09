import 'package:flutter/material.dart';
import 'package:photopy/adjust.dart';
import 'package:photopy/colorizer.dart';
import 'package:photopy/crop.dart';
import 'package:photopy/edit_download.dart';

// Import your Adjust page here

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Add a boolean variable to track whether "Filters" is active
  bool isFilterActive = true; // Set to true initially to light the Filters icon

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
                MaterialPageRoute(builder: (context) => EditPhotoDownloadScreen()),
              );
            },// Add download functionality here
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/AllPhoto.png', // Replace with actual image path
              fit: BoxFit.cover,
            ),
          ),
          // Adjust the height of the pink box by removing the Expanded widget
          Container(
            color: const Color.fromARGB(255, 245, 186, 255), // Light pink background
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8), // Adjust padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImage('assets/images/AllPhoto.png'), // Replace with actual image paths
                _buildImage('assets/images/AllPhoto.png'),
                _buildImage('assets/images/AllPhoto.png'),
                _buildImage('assets/images/AllPhoto.png'),
              ],
            ),
          ),
          // Move this directly after the pink box to remove extra space
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adjust padding to reduce space
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
                      MaterialPageRoute(builder: (context) => AdjustPage()),
                    );
                    setState(() {
                      isFilterActive = false; // Deactivate "Filters" when another option is selected
                    });
                  },
                ),
                _buildEditOption(Icons.color_lens, 'Colorizer', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorizerPage()),
                  );
                  setState(() {
                    isFilterActive = false; // Deactivate "Filters" when another option is selected
                  });
                }),
                _buildEditOption(Icons.crop, 'Crop', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CropPage()),
                  );
                  setState(() {
                    isFilterActive = false; // Deactivate "Filters" when another option is selected
                  });
                }),
                _buildEditOption(
                  Icons.filter_list,
                  'Filters',
                  isActive: isFilterActive, // Set the "Filters" icon to active
                  onTap: () {
                    setState(() {
                      isFilterActive = true; // Set to true when "Filters" is tapped
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build an image
  Widget _buildImage(String imagePath) {
    return Container(
      width: 80, // Adjust the width as needed
      height: 80, // Adjust the height as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1), // Optional: Add a border to the image
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover, // Ensure the image fits the box
      ),
    );
  }

  Widget _buildEditOption(IconData icon, String label, {bool isActive = false, Function()? onTap}) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: isActive ? Colors.blue : Colors.black, // Highlight if active
          ),
          onPressed: onTap, // Execute the passed function when tapped
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.black, // Change label color if active
          ),
        ),
      ],
    );
  }
}
