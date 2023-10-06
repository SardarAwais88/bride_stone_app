import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
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
  late NfcManager nfcManager;
  bool isNfcTagFound = false;
  String nfcTagData = ""; // Store NFC tag data here
  @override
  void initState() {
    super.initState();
    nfcManager = NfcManager.instance;

    // Start the NFC session
    nfcManager.startSession(
      onDiscovered: (NfcTag tag) async {
        // Handle NFC tag discovery when the app is in the foreground
        setState(() {
          isNfcTagFound = true;
          nfcTagData = tag.data.toString(); // Extract NFC tag data
        });
      },
    );
  }

  @override
  void dispose() {
    nfcManager.stopSession();
    super.dispose();
  }

  Future<void> _openWhatsApp() async {
    final whatsappNumber = _whatsappNumberController.text;
    final message = _messageController.text;

    if (isNfcTagFound) {
      // Handle NFC tag found
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            Icon(Icons.nfc),
            SizedBox(width: 8),
            Text('NFC Tag Found'),
          ],
        ),
      ));
      // You can also perform additional actions with the NFC tag here if needed
      // Perform additional actions with the NFC tag data
      print('NFC Tag Data: $nfcTagData');

      // You can also send the NFC tag data to a server, store it locally, etc.
    } else {
      // NFC tag not found, open WhatsApp as before
      final whatsappUrl =
          "https://wa.me/$whatsappNumber/?text=${Uri.encodeComponent(message)}";

      if (await canLaunch(whatsappUrl)) {
        await launch(whatsappUrl);
      } else {
        print('Could not launch WhatsApp.');
      }
    }
  }
  // late NfcManager nfcManager;
  // StreamSubscription<NfcTag>? nfcSubscription;
  // bool isNfcTagFound = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   nfcManager = NfcManager.instance;
  //   nfcSubscription = nfcManager.onTagDiscovered().listen((NfcTag tag) {
  //     // Handle NFC tag discovery here
  //     setState(() {
  //       isNfcTagFound = true;
  //     });
  //   });
  //   nfcManager.startSession(
  //     onDiscovered: (NfcTag tag) async {
  //       // Handle NFC tag discovery when the app is in the foreground
  //     },
  //   );
  // }
  //
  // @override
  // void dispose() {
  //   nfcSubscription?.cancel();
  //   nfcManager.stopSession();
  //   super.dispose();
  // }
  //
  // Future<void> _openWhatsApp() async {
  //   final whatsappNumber = _whatsappNumberController.text;
  //   final message = _messageController.text;
  //
  //   if (isNfcTagFound) {
  //     // Handle NFC tag found
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Row(
  //         children: [
  //           Icon(Icons.nfc),
  //           SizedBox(width: 8),
  //           Text('NFC Tag Found'),
  //         ],
  //       ),
  //     ));
  //     // You can also perform additional actions with the NFC tag here if needed
  //   } else {
  //     // NFC tag not found, open WhatsApp as before
  //     final whatsappUrl =
  //         "https://wa.me/$whatsappNumber/?text=${Uri.encodeComponent(message)}";
  //
  //     if (await canLaunch(whatsappUrl)) {
  //       await launch(whatsappUrl);
  //     } else {
  //       print('Could not launch WhatsApp.');
  //     }
  //   }
  // }
  // Future<void> _openWhatsApp() async {
  //   final whatsappNumber = _whatsappNumberController.text;
  //   final message = _messageController.text;
  //
  //   final whatsappUrl =
  //       "https://wa.me/$whatsappNumber/?text=${Uri.encodeComponent(message)}";
  //
  //   if (await canLaunch(whatsappUrl)) {
  //     await launch(whatsappUrl);
  //   } else {
  //     print('Could not launch WhatsApp.');
  //   }
  // }

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
