import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart'; // Import Awesome Dialog
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class WeblinkSocialsScreen extends StatefulWidget {
  const WeblinkSocialsScreen({Key? key}) : super(key: key);

  @override
  _WeblinkSocialsScreenState createState() => _WeblinkSocialsScreenState();
}

class _WeblinkSocialsScreenState extends State<WeblinkSocialsScreen> {
  TextEditingController _linkController = TextEditingController();
  StreamSubscription<NfcTag>? _nfcTagSubscription;
  bool _nfcReadSuccess = false;
  bool _nfcWriteSuccess = false;

  @override
  void initState() {
    super.initState();
    _initNFC();
  }

  @override
  void dispose() {
    _linkController.dispose();
    _nfcTagSubscription?.cancel();
    super.dispose();
  }

  void _initNFC() {
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        var ndef = Ndef.from(tag);
        if (ndef == null) {
          // Tag is not NDEF
          _showTagNotGetDialog();
          return;
        }

        try {
          String link = _linkController.text;
          if (link.isNotEmpty) {
            // Create an NdefMessage with the provided link
            NdefMessage message = NdefMessage([
              NdefRecord.createUri(Uri.parse(link)),
            ]);

            // Show a success message for reading
            _showTagReadSuccessfullyDialog();

            // Set the NFC read success flag
            setState(() {
              _nfcReadSuccess = true;
            });

            // Write the NdefMessage to the NFC tag
            await ndef.write(message);

            // Show a success message for writing
            _showTagWrittenSuccessfullyDialog();

            // Set the NFC write success flag
            setState(() {
              _nfcWriteSuccess = true;
            });
          }
        } catch (e) {
          // Handle write error
          _showErrorDialog('Error: $e');
        } finally {
          // Stop the NFC session
          NfcManager.instance.stopSession();
        }
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _pasteFromClipboard() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null) {
      _linkController.text = data.text ?? '';
    }
  }

  // Helper method for showing NFC tag not found dialog
  void _showTagNotGetDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Tag Not Found',
      desc: 'The NFC tag was not found.',
      btnOkText: 'OK',
      btnCancelText: 'Cancel',
      btnOkOnPress: () {},
    ).show();
  }

  // Helper method for showing NFC tag written successfully dialog
  void _showTagWrittenSuccessfullyDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES, // Changed to SUCCESS
      animType: AnimType.BOTTOMSLIDE,
      title: 'Tag Written Successfully',
      desc: 'The NFC tag was written successfully.',
      btnOkText: 'OK',
      btnCancelText: 'Cancel',
      btnOkOnPress: () {},
    ).show();
  }

  // Helper method for showing NFC tag read successfully dialog
  void _showTagReadSuccessfullyDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES, // Changed to SUCCESS
      animType: AnimType.BOTTOMSLIDE,
      title: 'Tag Read Successfully',
      desc: 'The NFC tag was read successfully.',
      btnOkText: 'OK',
      btnCancelText: 'Cancel',
      btnOkOnPress: () {},
    ).show();
  }

  // Helper method for showing NFC error dialog
  void _showErrorDialog(String error) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Error',
      desc: error,
      btnOkText: 'OK',
      btnCancelText: 'Cancel',
      btnOkOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weblink/Socials',
          style: TextStyle(
            fontFamily: 'antic didone',
            fontSize: 32,
            letterSpacing: 0.4,
            color: Color(0xFF42342D),
            shadows: [
              Shadow(
                blurRadius: 0.4,
                color: Color(0xFFF7F9F7),
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
            const SizedBox(height: 16.0),
            const Text(
              'What type of link would you prefer to access when you tap?',
              style: TextStyle(
                fontFamily: 'antic didone',
                fontSize: 24,
                letterSpacing: 0.4,
                fontWeight: FontWeight.bold,
                color: Color(0xFF42342D),
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _linkController,
              decoration: InputDecoration(
                hintText: 'Enter link here',
                fillColor: const Color(0xFF6b818c),
                filled: true,
                hintStyle: const TextStyle(
                  fontFamily: 'antic didone',
                  fontSize: 20,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: const TextStyle(
                fontFamily: 'antic didone',
                fontSize: 20,
              ),
            ),
            // NFC read success message
            if (_nfcReadSuccess)
              const Text(
                'NFC tag read successfully',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            // NFC write success message
            if (_nfcWriteSuccess)
              const Text(
                'NFC tag write successfully',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 40.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add NFC scanning logic here
                      // Initialize NFC when the button is pressed
                      _initNFC();
                    },
                    icon: const Icon(Icons.content_paste),
                    label: const Text('Paste from Clipboard'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      primary: const Color(0xFF42342D),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Example:',
              style: TextStyle(
                fontFamily: 'antic didone',
                fontSize: 24,
                letterSpacing: 0.4,
                fontWeight: FontWeight.bold,
                color: Color(0xFF42342D),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL('https://www.facebook.com/stoneforgold');
              },
              child: const Text(
                'https://www.facebook.com/stoneforgold',
                style: TextStyle(
                  fontFamily: 'antic didone',
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL(
                    'https://www.linkedin.com/company/stone-for-gold/about/');
              },
              child: const Text(
                'https://www.linkedin.com/company/stone-for-gold/about/',
                style: TextStyle(
                  fontFamily: 'antic didone',
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL('https://www.instagram.com/stoneforgold/');
              },
              child: const Text(
                'https://www.instagram.com/stoneforgold/',
                style: TextStyle(
                  fontFamily: 'antic didone',
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 70.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add NFC scanning logic here
                      // Initialize NFC when the button is pressed
                      _initNFC();
                    },
                    icon: const Icon(Icons.nfc),
                    label: const Text(
                      'Tap Your Product',
                      style: TextStyle(
                        fontFamily: 'antic didone',
                        fontSize: 22,
                        letterSpacing: 0.2,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      primary: const Color(0xFF42342D),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
