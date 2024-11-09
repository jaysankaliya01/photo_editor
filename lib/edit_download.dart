import 'package:flutter/material.dart';

class EditPhotoDownloadScreen extends StatelessWidget {
  const EditPhotoDownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Edit Photo'),
        // Removed the download button from actions
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/AllPhoto.png', // Replace with actual image path
              fit: BoxFit.cover,
            ),
          ),
          // Center the CustomSaveButton
          Center(
            child: CustomSaveButton(),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // children: [
              //   _buildEditOption(Icons.brightness_4, 'Adjust', onTap: () {}),
              //   _buildEditOption(Icons.color_lens, 'Colorizer', onTap: () {}),
              //   _buildEditOption(Icons.crop, 'Crop', onTap: () {}),
              //   _buildEditOption(Icons.filter_list, 'Filters', onTap: () {}),
              // ],
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
          onPressed: onTap, // Execute the passed function when tapped
        ),
        Text(label),
      ],
    );
  }
}

// Custom "Saved To Gallery" button widget
class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 176, 252), // Pink background
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.purpleAccent, width: 2),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Saved To Gallery',
            style: TextStyle(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.check,
            color: Colors.purpleAccent,
          ),
        ],
      ),
    );
  }
}
