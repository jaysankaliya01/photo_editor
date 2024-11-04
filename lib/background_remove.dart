import 'package:flutter/material.dart';
import 'package:photo_editor/background_download.dart';

class RemoveBackgroundPage extends StatelessWidget {
  const RemoveBackgroundPage({Key? key}) : super(key: key);

nter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/AllPhoto.png', // Replace with your local image asset
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.crop_square,
                    size: 48.0,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Select',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Select a part you want to not remove'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
