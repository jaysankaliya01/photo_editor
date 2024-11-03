import 'package:flutter/material.dart';
import 'package:photo_editor/colorizer.dart';
import 'package:photo_editor/crop.dart';
import 'package:photo_editor/edit_download.dart';
import 'package:photo_editor/filter.dart';

// Import your Adjust page here

class AdjustPage extends StatefulWidget {
  @override
  _AdjustPageState createState() => _AdjustPageState();
}

class _AdjustPageState extends State<AdjustPage> {
  // Define the state variables for sliders
  double _exposure = 0.0;
  double _contrast = 0.0;
  double _highlights = 0.0;
  double _shadows = 0.0;
  double _whites = 0.0;
  double _blacks = 0.0;

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
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Color.fromARGB(255, 245, 186, 255), // Light pink background
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    _buildSlider('Exposure', _exposure, (value) {
                      setState(() {
                        _exposure= value;
                      });
                    }),
                    _buildSlider('Contrast', _contrast, (value) {
                      setState(() {
                        _contrast = value;
                      });
                    }),
                    _buildSlider('Highlights', _highlights, (value) {
                      setState(() {
                        _highlights = value;
                      });
                    }),
                    _buildSlider('Shadows', _shadows, (value) {
                      setState(() {
                        _shadows = value;
                      });
                    }),
                    _buildSlider('Whites', _whites, (value) {
                      setState(() {
                        _whites = value;
                      });
                    }),
                    _buildSlider('Blacks', _blacks, (value) {
                      setState(() {
                        _blacks = value;
                      });
                    }),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEditOption(
                  Icons.brightness_4, 
                  'Adjust',
                  isActive: true, // Highlight this icon since we're on the AdjustPage
                ),
                _buildEditOption(Icons.color_lens, 'Colorizer', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorizerPage()), 
                  );
                }),
                _buildEditOption(Icons.crop, 'Crop',onTap: () {
                    // Navigate to the AdjustPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CropPage()), // AdjestPage is the page you want to navigate to
                    );
                  },),
                _buildEditOption(Icons.filter_list, 'Filters',onTap: () {
                    // Navigate to the AdjustPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterPage()), // AdjestPage is the page you want to navigate to
                    );
                  },),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Slider(
          value: value,
          min: -1.0,
          max: 1.0,
          onChanged: onChanged,
        ),
      ],
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
