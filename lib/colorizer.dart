import 'package:flutter/material.dart';
import 'package:photo_editor/adjest.dart';
import 'package:photo_editor/crop.dart';
import 'package:photo_editor/edit_download.dart';
import 'package:photo_editor/filter.dart';

// Import your Adjust page here

class ColorizerPage extends StatefulWidget {
  @override
  _ColorizerPageState createState() => _ColorizerPageState();
}

class _ColorizerPageState extends State<ColorizerPage> {
  // Define the state variables for sliders
  double _exposure = 0.0;
  double _contrast = 0.0;
  double _highlights = 0.0;

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
                    _buildSlider('Hue', _exposure, (value) {
                      setState(() {
                        _exposure = value;
                      });
                    }),
                    _buildSlider('Saturation', _contrast, (value) {
                      setState(() {
                        _contrast = value;
                      });
                    }),
                    _buildSlider('Luminance', _highlights, (value) {
                      setState(() {
                        _highlights = value;
                      });
                    }),
                    _buildColorMixRow(), // Add the color mix row here
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
                  onTap: () {
                    // Navigate to the AdjustPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdjustPage()), // AdjustPage is the page you want to navigate to
                    );
                  },
                  isSelected: false, // Adjust is not selected
                ),
                _buildEditOption(Icons.color_lens, 'Colorizer', isSelected: true // Colorizer is selected on this page
                ),
                _buildEditOption(Icons.crop, 'Crop', isSelected: false,onTap: () {
                    // Navigate to the AdjustPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CropPage()), // AdjestPage is the page you want to navigate to
                    );
                  },),
                _buildEditOption(Icons.filter_list, 'Filters', isSelected: false,onTap: () {
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

  Widget _buildColorMixRow() {
    return Container(
      color: Color.fromARGB(255, 245, 186, 255), // Light pink background
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Color Mix',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              _buildColorCircle(Colors.redAccent),
              _buildColorCircle(Colors.orangeAccent),
              _buildColorCircle(Colors.yellowAccent),
              _buildColorCircle(Colors.lightGreenAccent),
              _buildColorCircle(Colors.cyanAccent),
              _buildColorCircle(Colors.blueAccent),
              _buildColorCircle(Colors.purpleAccent),
              _buildColorCircle(Colors.pinkAccent),
            ],
          ),
          GestureDetector(
            onTap: () {
              // Add functionality for Done button
            },
            child: Text(
              'Done',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 1),
        ),
      ),
    );
  }

  // Update this function to highlight selected items
  Widget _buildEditOption(IconData icon, String label, {Function()? onTap, required bool isSelected}) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: isSelected ? Colors.blueAccent : Colors.black, // Highlight selected item with color
          ),
          onPressed: onTap, // Execute the passed function when tapped
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.blueAccent : Colors.black, // Highlight text for selected item
          ),
        ),
      ],
    );
  }
}



