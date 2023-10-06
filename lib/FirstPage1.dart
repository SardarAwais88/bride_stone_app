import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  void _openWebView(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('WebView'),
            ),
            body: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stone For Gold',
          style: TextStyle(
            fontFamily: 'lexend',
            fontSize: 32, // H1: 32
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Added space above the image
            Expanded(
              child: Image.asset(
                'assets/images/1694692203-sfg-logo-black.png',
                fit: BoxFit.contain,
              ),
            ),
            BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.black, // Set icon color
                  ),
                  label: 'Facebook',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.instagram,
                    color: Colors.black, // Set icon color
                  ),
                  label: 'Instagram',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.tiktok,
                    color: Colors.black, // Set icon color
                  ),
                  label: 'Tiktok',
                ),
              ],
              onTap: (index) {
                String platform;
                if (index == 0) {
                  platform = 'https://www.facebook.com/stoneforgold';
                } else if (index == 1) {
                  platform = 'https://www.instagram.com/stoneforgold';
                } else {
                  platform = 'https://www.tiktok.com/stoneforgold';
                }
                _openWebView(context, platform); // Open link in WebView
              },
              backgroundColor: Color(0xFFF6F3F0),
              selectedLabelStyle: TextStyle(
                color: Color(0xFF000000),
              ),
              unselectedLabelStyle: TextStyle(
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/customize');
              },
              child: Text('Customize your product Now'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF6F3F0),
    );
  }
}
