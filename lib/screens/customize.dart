import 'dart:io';

import 'package:bride_stone_app/screens/HelpAndFAQScreen.dart';
import 'package:bride_stone_app/screens/LinkHistoryScreen.dart';
import 'package:bride_stone_app/screens/customize_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomizePage extends StatelessWidget {
  const CustomizePage({Key? key}) : super(key: key);
  final String stoneForGoldUrl = "https://www.stoneforgold.com";

  void _launchURL() async {
    String url = stoneForGoldUrl;
    String url1 = stoneForGoldUrl;

    if (Platform.isIOS) {
      // Use Safari on iOS
      url = 'https://www.stoneforgold.com';
    } else if (Platform.isAndroid) {
      // Use Chrome on Android
      url = 'googlechrome,defaultbrowser://www.stoneforgold.com';
      url1 = "https://www.stoneforgold.com";
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Fallback to using a web URL if the app-specific URL fails
      await launch(stoneForGoldUrl);
    }
  }
  // void _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // void _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  // void _launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  // Future<void> _launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // void _showSnackbar(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  // Future<void> _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  //
  // void _openDefaultBrowser() async {
  //   String websiteUrl = "https://stoneforgold.com/";
  //
  //   if (defaultTargetPlatform == TargetPlatform.iOS) {
  //     // Open in Safari for iOS
  //     await _launchURL(websiteUrl);
  //   } else if (defaultTargetPlatform == TargetPlatform.android) {
  //     // Open in Chrome for Android
  //     await launch(websiteUrl, forceSafariVC: false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stone for Gold',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'antic_didone',
            color: Colors.black,
            fontWeight: FontWeight.w300,
            shadows: [
              Shadow(
                blurRadius: 2.0,
                color: Color(0xFF6B818C), // Accents color
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Unleash the full potential of your Stone for Gold product with this app now',
              style: TextStyle(
                fontSize: 24, // Reduced font size
                fontFamily: 'lexend',
                color: Colors.black,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomizeScreen(),
                  ),
                );
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
                    Icons.edit, // Replace with the appropriate icon
                    color: Colors.white,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8.0), // Add some space between icon and text
                  Text(
                    'Customize',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LinkHistoryScreen()),
                );
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
                    FontAwesomeIcons.link, // Replace with the appropriate icon
                    color: Colors.white,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8.0), // Add some space between icon and text
                  Text(
                    'Link History',
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
              // onPressed: () async {
              //   var url = 'https://www.stoneforgold.com';
              //   if (await canLaunch(url)) {
              //     await launch(url);
              //   }
              // },
              // onPressed: () async {
              //   var url = 'https://www.stoneforgold.com';
              //   if (await canLaunch(url)) {
              //     print('Launching URL...');
              //     await launch(url);
              //   } else {
              //     print('Could not launch URL');
              //   }
              // },
              // onPressed: () async {
              //   if (stoneforgold.isNotEmpty) {
              //     String stonefliesUrl = 'https://stoneforgold.com/';
              //
              //     await launch(stonefliesUrl);
              //   }
              // },
              // onPressed: () async {
              //   var url = 'https://stoneforgold.com/';
              //   if (await canLaunch(url)) {
              //     await launch(url);
              //   } else {
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //       content: Text('Could not open website'),
              //     ));
              //   }
              // },
              // onPressed: () async {
              //
              // }
              //   if (await canLaunch(websiteUrl)) {
              //     await launch(websiteUrl);
              //   } else {
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //       content: Text('Could not open the website'),
              //     ));
              //   }
              // },

              // onPressed: () async {
              //   String websiteUrl = "https://stoneforgold.com/";
              //   _launchURL(websiteUrl);
              // },

              // onPressed: () async {
              //   String websiteUrl = "https://stoneforgold.com/";
              //   await _launchURL(websiteUrl);
              // },
              // onPressed: () async {
              //   String websiteUrl = "https://www.google.com";
              //
              //   final Uri uri = Uri.parse(websiteUrl);
              //   try {
              //     if (await canLaunchUrl(uri)) {
              //       await launchUrl(uri);
              //     } else {
              //       _showSnackbar(context, 'Could not open website');
              //     }
              //   } catch (e) {
              //     print('Error launching URL: $e');
              //     _showSnackbar(context, 'Error launching website');
              //   }
              // },
              // onPressed: () {
              //   _launchURL,
              //
              //   // Define the URL you want to open
              //   // String url = 'https://stoneforgold.com/';
              //   //
              //   // // Launch the URL
              //   // _launchURL(url);
              // },
              onPressed: _launchURL,
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
                        .cartShopping, // Replace with the appropriate icon
                    color: Colors.white,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8.0), // Add some space between icon and text
                  Text(
                    'Buy Our Prdoucts',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpFaqScreen(),
                  ),
                );
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
                    Icons.help, // Replace with the appropriate icon
                    color: Colors.white,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8.0), // Add some space between icon and text
                  Text(
                    'Help-FAQ',
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
                    Icons.settings, // Replace with the appropriate icon
                    color: Colors.white,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8.0), // Add some space between icon and text
                  Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'lexend',
                      color: Colors.white,
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
