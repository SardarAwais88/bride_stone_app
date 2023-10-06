import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Phone Number',
          style: TextStyle(
            fontFamily: 'lexend',
            fontSize: 32,
            fontWeight: FontWeight.w300,
            color: Color(0xFF42342D), // Primary Text
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please provide your telephone number:',
              style: TextStyle(
                fontFamily: 'lexend',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF42342D), // Primary Text
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                fillColor: const Color(0xFF6b818c), // Accents color
                filled: true,
                hintStyle: const TextStyle(
                  fontFamily: 'lexend',
                  fontSize: 20,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: const TextStyle(
                fontFamily: 'lexend',
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Clipboard.getData(Clipboard.kTextPlain)
                    .then((ClipboardData? data) {
                  if (data != null) {
                    setState(() {
                      _phoneNumberController.text = data.text ?? '';
                    });
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF42342D), // Primary Text
                onPrimary: Colors.white,
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.content_paste),
                  SizedBox(width: 8.0),
                  Text(
                    'Paste from Clipboard',
                    style: TextStyle(
                      fontFamily: 'lexend',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Example: 94597706',
              style: TextStyle(
                fontFamily: 'lexend',
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement NFC scanning logic here
                },
                icon: const Icon(
                  Icons.nfc,
                  size: 32,
                  color: Colors.white, // Primary Text
                ), // NFC Icon
                label: const Text(
                  'Tap Your Product',
                  style: TextStyle(
                    fontFamily: 'lexend',
                    fontSize: 20,
                    color: Colors.white, // Primary Text
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF42342D), // Primary Text
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
