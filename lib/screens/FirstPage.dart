import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
    }
  }

  void launchFacebookURL() async {
    if (await canLaunch('https://www.facebook.com/stoneforgold')) {
      await launch('https://www.facebook.com/stoneforgold');
    } else {
      // Handle error.
    }
  }
  // void _launchURL(String url) async {
  //   try {
  //     if (await canLaunch(url)) {
  //       await launch(url, forceSafariVC: false);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  // void _launchURL(String url) async {
  //   try {
  //     final uri = Uri.parse(url);
  //     if (await canLaunchUrl(uri)) {
  //       await launchUrl(uri);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stone For Gold',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'lexend',
            fontWeight: FontWeight.w300, // Use Lexend Light for H1
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
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            Image.asset(
              'assets/images/1694692203-sfg-logo-black.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/customize');
              },
              child: Text(
                'Customize Your Product Now',
                style: TextStyle(
                  fontSize: 20, // Use Lexend Regular for body
                  fontFamily: 'lexend',
                  fontWeight: FontWeight.w400, // Use Lexend Regular for body
                  color: Colors.white, // Text color
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF6B818C), // Accents
                minimumSize: Size(double.minPositive, 70),
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Follow Us On',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'lexend',
                fontWeight: FontWeight.w400, // Use Lexend Regular
                color: Color(0xFF42342D), // Primary Text
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaButton(
                  icon: Icons.facebook,
                  label: 'Facebook',
                  onPressed: () {
                    // _launchURL('https://www.facebook.com/stoneforgold');
                    launchFacebookURL();
                  },
                ),
                SocialMediaButton(
                  icon: FontAwesomeIcons.instagram,
                  label: 'Instagram',
                  onPressed: () {
                    _launchURL('https://www.instagram.com/stoneforgold');
                  },
                ),
                SocialMediaButton(
                  icon: Icons.tiktok,
                  label: 'Tiktok',
                  onPressed: () {
                    _launchURL('https://www.tiktok.com/stoneforgold');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF6F3F0), // Background
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  SocialMediaButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          minimumSize: Size(20, 10),
          padding: EdgeInsets.all(6.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
