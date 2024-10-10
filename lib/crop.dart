import 'package:flutter/material.dart';
import 'package:photo_editor/adjest.dart';
import 'package:photo_editor/colorizer.dart';
import 'package:photo_editor/edit_download.dart';
import 'package:photo_editor/filter.dart';

// Import your Adjust page here

class CropPage extends StatefulWidget {
  @override
  _CropPageState createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Edit Photo'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // Navigate to the EditPhotoDownload page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditPhotoDownloadScreen()),
              );
            }, // Add download functionality here
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
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEditOption(
                  Icons.brightness_4, 
                  'Adjust', // Adjust is not selected
                  onTap: () {
                    // Navigate to the AdjustPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdjustPage()), // AdjestPage is the page you want to navigate to
                    );
                  },
                ),
                _buildEditOption(Icons.color_lens, 'Colorizer', 
                  isActive: false, // Colorizer is not selected
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ColorizerPage()), 
                    );
                  }
                ),
                _buildEditOption(
                  Icons.crop, 
                  'Crop',
                  isActive: true,
                ),
                _buildEditOption(
                  Icons.filter_list, 
                  'Filters',
                  isActive: false, // Filters are not selected
                  onTap: () {
                    // Navigate to the AdjustPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterPage()), // AdjestPage is the page you want to navigate to
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
