import 'package:flutter/material.dart';

class InstagramScreen extends StatelessWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Color(0xFF42342D), // Primary Text
            fontSize: 32, // H1: 32
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 0.4, // H1: Stroke 0.4
                color: Color(0xFFF7F9F7), // Contrast Text
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please provide your Instagram username:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your Instagram username',
                fillColor: Color(0xFF6B818C), // Accents
                filled: true,
                hintStyle: TextStyle(color: Colors.white),
                prefixText: 'www.instagram.com/',
                // Set the text color when typing
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.2),
                    width: 0.2, // Navbar: Stroke 0.2
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.4),
                    width: 0.4, // H2: Stroke 0.4
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white, // Text color of the input text
                fontSize: 16, // H2: 16
              ),
            ),
            SizedBox(height: 300),
            ElevatedButton(
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tap Your Product',
                    style: TextStyle(
                      fontSize: 22, // Navbar: 22
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2, // Navbar: Stroke 0.2
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      child: Transform.rotate(
                        angle: 3.14159265359,
                        child: Icon(Icons.nfc, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
