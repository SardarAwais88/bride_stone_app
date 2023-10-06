import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramScreen extends StatelessWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String instagramUsername = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Color(0xFF42342D),
            fontSize: 32,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 0.4,
                color: Color(0xFFF7F9F7),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Please provide your Instagram username:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'www.instagram.com/',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your Instagram username',
                      fillColor: Color(0xFF6B818C),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    onChanged: (value) {
                      instagramUsername = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 300),
            ElevatedButton(
              onPressed: () async {
                if (instagramUsername.isNotEmpty) {
                  String instagramUrl =
                      'https://www.instagram.com/$instagramUsername';

                  await launch(instagramUrl);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tap Your Product',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      child: Transform.rotate(
                        angle: 3.14159265359,
                        child: const Icon(Icons.nfc, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
