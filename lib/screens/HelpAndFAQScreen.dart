import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class HelpFaqScreen extends StatelessWidget {
  const HelpFaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & FAQ'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Why is there no response when I bring the product close to my phone?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "To try our product, just click the 'Test Read' button below. For iPhone users, locate the scanner near the camera. Android users, please ensure that 'NFC' is enabled in your device settings, typically located in the middle of the device or near the camera. "
              "Keep in mind that if your device is in low-power mode, scanning may be less likely as the scanner might be disabled to save battery. Verify your device's compatibility here:",
            ),
            const SizedBox(height: 16.0),
            const Text(
              'How can I remove the link from my product?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
                "To remove the link from your product, please press the 'Erase' button located below"),
            const SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                // Add custom behavior for the Help-FAQ button
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF6B818C), // Accents color
                padding: const EdgeInsets.all(16.0), // Increased padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.read_more, // Replace with the appropriate icon
                    color: Colors.white,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8.0), // Add some space between icon and text
                  Text(
                    'Test Read',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'lexend',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add custom behavior for the Help-FAQ button
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF6B818C), // Accents color
                padding: const EdgeInsets.all(16.0), // Increased padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons
                        .eraser, // Replace with the appropriate icon
                    color: Colors.white,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8.0), // Add some space between icon and text
                  Text(
                    'Erase',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'lexend',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
