import 'package:bride_stone_app/screens/EmailScreen.dart';
import 'package:bride_stone_app/screens/HelpAndFAQScreen.dart';
import 'package:bride_stone_app/screens/InstagramScreen.dart';
import 'package:bride_stone_app/screens/PhoneNumberScreen.dart';
import 'package:bride_stone_app/screens/WeblinkSocialsScreen.dart';
import 'package:bride_stone_app/screens/WhatsAppScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _expandedButton(String label, IconData? icon, Function onPressed) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF6B818C), // Accents color
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) // Conditionally add an icon
                Icon(icon),
              SizedBox(
                  width:
                      icon != null ? 8.0 : 0), // Add spacing if there's an icon
              Text(
                label,
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 22, // H1: 22
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customize',
          style: TextStyle(
            color: Color(0xFF42342D), // Primary Text
            fontSize: 32, // H1: 32
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30.0),
            _expandedButton('Web Link / Socials', Icons.link, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WeblinkSocialsScreen(),
                ),
              );
            }),
            SizedBox(height: 20.0),
            _expandedButton('Phone Number', Icons.phone, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PhoneNumberScreen(),
                ),
              );
            }),
            SizedBox(height: 20.0),
            _expandedButton('Email', Icons.email, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EmailScreen(),
                ),
              );
            }),
            SizedBox(height: 20.0),
            _expandedButton('WhatsApp', Icons.message, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WhatsAppScreen(),
                ),
              );
            }),
            SizedBox(height: 20.0),
            _expandedButton('Instagram', FontAwesomeIcons.instagram, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InstagramScreen(),
                ),
              );
            }),
            SizedBox(height: 100.0),
            _expandedButton('Help-Faq', Icons.help, () {
              // _launchURL('https://www.instagram.com/example/');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpFaqScreen(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
