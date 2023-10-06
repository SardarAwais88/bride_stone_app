import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppScreen extends StatefulWidget {
  const WhatsAppScreen({Key? key}) : super(key: key);

  @override
  _WhatsAppScreenState createState() => _WhatsAppScreenState();
}

class _WhatsAppScreenState extends State<WhatsAppScreen> {
  final TextEditingController _whatsappNumberController =
      TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  // late NfcManager nfcManager;
  // late StreamSubscription<NfcTag> nfcSubscription;

  // @override
  // void initState() {
  //   super.initState();
  //   nfcManager = NfcManager.instance;
  //   nfcSubscription = nfcManager.onTagDiscovered().listen((NfcTag tag) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Row(
  //         children: [
  //           Icon(Icons.nfc),
  //           SizedBox(width: 8),
  //           Text('NFC Tag Found'),
  //         ],
  //       ),
  //     ));
  //   });
  // }

  // @override
  // void dispose() {
  //   nfcSubscription.cancel();
  //   super.dispose();
  // }

  Future<void> _openWhatsApp() async {
    final whatsappNumber = _whatsappNumberController.text;
    final message = _messageController.text;

    final whatsappUrl =
        "https://wa.me/$whatsappNumber/?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print('Could not launch WhatsApp.');
    }
  }

  // void _openWhatsApp() async {
  //   final whatsappNumber = _whatsappNumberController.text;
  //   final message = _messageController.text;
  //
  //   final whatsappUrl =
  //       "https://wa.me/$whatsappNumber/?text=${Uri.encodeComponent(message)}";
  //
  //   if (await canLaunch(whatsappUrl)) {
  //     await launch(whatsappUrl);
  //   } else {
  //     // Handle error, e.g., WhatsApp is not installed
  //     print('Could not launch WhatsApp.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            fontFamily: 'antic_didone', // Antic Didone font
            fontSize: 32, // H1: 32
            letterSpacing: 0.4,
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
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please provide your WhatsApp number:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 3), // Add 3 spaces
            TextField(
              controller: _whatsappNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Enter your WhatsApp number',
                filled: true,
                fillColor: Color(0xFF6b818c), // Accents color
                hintStyle: TextStyle(
                  fontFamily: 'antic didone', // Antic Didone font
                  fontSize: 20, // Body: 20
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(
                fontFamily: 'antic didone', // Antic Didone font
                fontSize: 20, // Body: 20
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter the message:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 3), // Add 3 spaces
            TextField(
              controller: _messageController,
              keyboardType: TextInputType.multiline,
              maxLines: null, // Allow multiline input
              decoration: const InputDecoration(
                hintText: 'Enter your message',
                filled: true,
                fillColor: Color(0xFF42342D), // Primary Text color
                hintStyle: TextStyle(
                  fontFamily: 'antic didone', // Antic Didone font
                  fontSize: 20, // Body: 20
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(
                fontFamily: 'antic didone', // Antic Didone font
                fontSize: 20, // Body: 20
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 100), // Adjusted spacing here
            ElevatedButton(
              onPressed: () {
                _openWhatsApp();
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF42342D),
                onPrimary: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Tap Your Product   '),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white,
                          width: 2.0), // Adjust border properties as needed
                    ),
                    padding: const EdgeInsets.all(8.0),
                    // Adjust padding as needed
                    child: Transform.rotate(
                      angle: 1.50, // Rotate 180 degrees (pi radians)
                      child: const Icon(Icons.nfc),
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
