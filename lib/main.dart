import 'package:bride_stone_app/screens/stone_for_gold_page.dart';
import 'package:flutter/material.dart';

import 'screens/FirstPage.dart';
import 'screens/customize.dart';

void main() {
  runApp(const MainApp());
}

// const MaterialColor myTeal = MaterialColor(
//   0xFF008080,
//   <int, Color>{
//     50: Color(0xFFE0F2F2),
//     100: Color(0xFFCCECE6),
//     200: Color(0xFF99C2C2),
//     300: Color(0xFF669999),
//     400: Color(0xFF337373),
//     500: Color(0xFF008080),
//     600: Color(0xFF006666),
//     700: Color(0xFF004D4D),
//     800: Color(0xFF003333),
//     900: Color(0xFF001919),
//   },
// );

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFC App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const NFCScreen(),
      home: const FirstPage(),
      // Set NFCScreen as the initial screen
      routes: <String, WidgetBuilder>{
        '/stoneForGold': (context) => const StoneForGoldPage(),
        '/customize': (context) => const CustomizePage(),

        /// Define a route for StoneForGoldPage
      },
    );
  }
}
