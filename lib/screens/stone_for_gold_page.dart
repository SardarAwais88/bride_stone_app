import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoneForGoldPage extends StatelessWidget {
  const StoneForGoldPage({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stone for Gold',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'antic_didone',
            color: Color(0xFF000000), // Primary Text
            shadows: [
              Shadow(
                blurRadius: 0.4,
                color: Color(0xFFF7F9F7), // Contrast Text
                offset: Offset(0, 0),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Unleash the full potential for your Stone for Gold product with this app now',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40, // H1: 32
                fontFamily: 'antic_didone',
                color: Color(0xFF000000), // Primary Text
                shadows: [
                  Shadow(
                    blurRadius: 0.4,
                    color: Color(0xFF000000), // Contrast Text
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add custom behavior for the Customize button
              },
              child: const Text(
                'Customize',
                style: TextStyle(
                  fontSize: 32, // H1: 32
                  fontFamily: 'lexend',
                  fontWeight: FontWeight.w300, // Lexend Light
                  letterSpacing: 0.4, // Stroke 0.4
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Add custom behavior for the Link History button
              },
              child: const Text(
                'Link History',
                style: TextStyle(
                  fontSize: 24, // H2: 24
                  fontFamily: 'lexend',
                  fontWeight: FontWeight.normal, // Lexend Regular
                  letterSpacing: 0.4, // Stroke 0.4
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                _launchURL('https://www.stoneforgold.com');
              },
              child: const Text(
                'Buy Our Products',
                style: TextStyle(
                  fontSize: 22, // Navbar: 22
                  fontFamily: 'lexend',
                  letterSpacing: 0.2, // Navbar stroke 0.2
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Add custom behavior for the Help-FAQ button
              },
              child: const Text(
                'Help-FAQ',
                style: TextStyle(
                  fontSize: 20, // Body: 20
                  fontFamily: 'lexend',
                  fontWeight: FontWeight.normal, // Lexend Regular
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Add custom behavior for the Settings button
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 8.0),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20, // Body: 20
                      fontFamily: 'lexend',
                      fontWeight: FontWeight.normal, // Lexend Regular
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
