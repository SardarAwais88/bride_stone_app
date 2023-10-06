import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Email',
          style: TextStyle(
            fontFamily: 'antic didone', // Antic Didone font
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
              'Please Enter your Email Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email address',
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
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Subject',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                hintText: 'Enter the subject',
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
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Message',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _messageController,
              maxLines: null,
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
            const SizedBox(height: 20),
            const Text(
              'Example:',
              style: TextStyle(
                fontFamily: 'antic didone', // Antic Didone font
                fontSize: 16,
                color: Color(0xFF42342D), // Primary Text color
              ),
            ),
            const Text(
              'Email Address: info@stoneforgold.com\nSubject: Inquiry\nMessage: I am writing to inquire about your leather',
              style: TextStyle(
                fontFamily: 'antic didone', // Antic Didone font
                fontSize: 16,
                color: Color(0xFF42342D), // Primary Text color
              ),
            ),
            const SizedBox(height: 150), // Reduced spacing here
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Implement NFC scanning logic here
                    },
                    icon: const Icon(Icons.nfc, size: 32), // NFC Icon
                    label: const Text(
                      'Tap Your Product',
                      style: TextStyle(
                        fontFamily: 'antic didone', // Antic Didone font
                        fontSize: 22, // Navbar: 22
                        letterSpacing: 0.2,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF42342D),
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
          ],
        ),
      ),
    );
  }
}
