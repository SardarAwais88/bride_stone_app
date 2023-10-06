import 'package:flutter/material.dart';

class NfcPage extends StatelessWidget {
  const NfcPage({Key? key}) : super(key: key);

  Widget buildButton(IconData icon, String text, Function onPressed) {
    return Column(
      children: [
        Icon(
          icon,
          size: 72, // Adjust the icon size as needed
          color: Colors.red, // Set the icon color
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 20, // Adjust the text size as needed
            color: Colors.red, // Set the text color
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NFC Page',
          style: TextStyle(
            fontFamily: 'lexend',
            fontSize: 32, // H1: 32
            color: Color(0xFF42342D), // Primary Text
            shadows: [
              Shadow(
                blurRadius: 0.4,
                color: Color(0xFFF7F9F7), // Contrast Text
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(Icons.nfc, 'Read NFC Tag', () {
              // Add NFC Read functionality here
            }),
            buildButton(Icons.nfc, 'Write NFC Tag', () {
              // Add NFC Write functionality here
            }),
            buildButton(Icons.save, 'Save NFC Messages', () {
              // Add functionality to save NFC messages
            }),
            buildButton(Icons.create, 'Create NFC Messages', () {
              // Add functionality to create NFC messages
            }),
            buildButton(Icons.explicit, 'NFC Expert', () {
              // Add functionality for NFC expert
            }),
            buildButton(Icons.help, 'Help', () {
              // Add functionality for Help
            }),
            buildButton(Icons.settings, 'Settings', () {
              // Add functionality for Settings
            }),
            Text(
              'By purchasing NFC tags or other products through the link above, I will receive a small portion of the purchase price as support for the development of the app.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add NFC functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Blue background
                    onPrimary: Colors.white, // White text
                  ),
                  icon: Icon(Icons.nfc),
                  label: Text('NFC'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add QR & Barcode functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Blue background
                    onPrimary: Colors.white, // White text
                  ),
                  icon: Icon(Icons.qr_code),
                  label: Text('QR & Barcode'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add Document functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Blue background
                    onPrimary: Colors.white, // White text
                  ),
                  icon: Icon(Icons.description),
                  label: Text('Document'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add 3D functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Blue background
                    onPrimary: Colors.white, // White text
                  ),
                  icon: Icon(Icons.threed_rotation),
                  label: Text('3D'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add More functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Blue background
                    onPrimary: Colors.white, // White text
                  ),
                  icon: Icon(Icons.more_horiz),
                  label: Text('More'),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF6F3F0), // Background
    );
  }
}
