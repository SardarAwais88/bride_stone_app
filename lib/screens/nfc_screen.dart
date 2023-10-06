import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class NFCScreen extends StatelessWidget {
  const NFCScreen({Key? key});

  Future<void> _startNFC() async {
    try {
      // Check NFC availability
      bool isAvailable = await NfcManager.instance.isAvailable();

      if (isAvailable) {
        // Start NFC session
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            try {
              // Check if the tag is compatible with NDEF
              Ndef? ndef = Ndef.from(tag);

              if (ndef == null) {
                print('Tag is not compatible with NDEF');
                return;
              }

              // Read NDEF message
              NdefMessage message = await ndef.read();

              for (NdefRecord record in message.records) {
                print('NDEF Record Payload: ${record.payload}');
              }
            } catch (e) {
              print('Error handling NFC tag: $e');
            } finally {
              // Stop the session after interacting with the tag
              await NfcManager.instance.stopSession();
            }
          },
        );
      } else {
        print('NFC is not available on this device.');
      }
    } catch (e) {
      print('Error starting NFC session: $e');
    }
  }

  Future<void> _writeNFC() async {
    try {
      // Check NFC availability
      bool isAvailable = await NfcManager.instance.isAvailable();

      if (isAvailable) {
        // Start NFC session
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            try {
              // Check if the tag is compatible with NDEF
              Ndef? ndef = Ndef.from(tag);

              if (ndef == null) {
                print('Tag is not compatible with NDEF');
                return;
              }

              // Prepare the NDEF message you want to write
              NdefMessage message = NdefMessage([
                NdefRecord.createText('Hello, NFC!'),
              ]);

              // Write the NDEF message to the tag
              await ndef.write(message);

              print('NDEF Message written successfully');
            } catch (e) {
              print('Error writing NFC tag: $e');
            } finally {
              // Stop the session after writing the tag
              await NfcManager.instance.stopSession();
            }
          },
        );
      } else {
        print('NFC is not available on this device.');
      }
    } catch (e) {
      print('Error starting NFC session: $e');
    }
  }

  void _showSocialLinks(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            children: [
              const Text('Social Links'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.tiktok),
                    onPressed: () {
                      _launchURL('https://www.tiktok.com/');
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                    onPressed: () {
                      _launchURL('https://www.instagram.com/');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.facebook),
                    onPressed: () {
                      _launchURL('https://www.facebook.com/');
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchURL(String url) async {
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
          'NFC Read Write App',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'antic_didone',
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tap the button to read/write NFC',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'antic_didone',
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
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _startNFC,
              child: const Text(
                'Start NFC',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'lexend',
                  letterSpacing: 0.2,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _writeNFC,
              child: const Text(
                'Write NFC Tag',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'lexend',
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _showSocialLinks(context);
              },
              child: const Text(
                'Customize Your Product Now',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'lexend',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/customize');
              },
              child: Text('Go to Customize Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stoneForGold');
              },
              child: Text('Go to Stone for Gold Page'),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF6F3F0),
    );
  }
}
