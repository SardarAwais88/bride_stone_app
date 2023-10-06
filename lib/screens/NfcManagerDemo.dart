// import 'package:flutter/material.dart';
// import 'package:nfc_manager/nfc_manager.dart';
//
// class NfcManagerDemo extends StatefulWidget {
//   @override
//   _NfcManagerDemoState createState() => _NfcManagerDemoState();
// }
//
// class _NfcManagerDemoState extends State<NfcManagerDemo> {
//   bool isNfcAvailable = false;
//   NfcTag? nfcTag;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkNfcAvailability();
//   }
//
//   Future<void> _checkNfcAvailability() async {
//     setState(() async {
//       isNfcAvailable = await NfcManagerFlutter.instance.isAvailable();
//     });
//   }
//
//   Future<void> _startNfcSession() async {
//     await NfcManagerFlutter.instance.startSession(
//         onDiscovered: (NfcTag tag) async {
//       setState(() {
//         nfcTag = tag;
//       });
//     });
//   }
//
//   Future<void> _readNfcTag() async {
//     if (nfcTag != null) {
//       var ndefMessage =
//           await NfcManagerFlutter.instance.readNdefMessage(nfcTag);
//       // Do something with the NDEF message here.
//     }
//   }
//
//   Future<void> _writeNfcTag() async {
//     if (nfcTag != null) {
//       var ndefMessage = NdefMessage([
//         NdefRecord(NdefRecordType.text, 'Hello, world!', languageCode: 'en'),
//       ]);
//       await NfcManagerFlutter.instance.writeNdefMessage(nfcTag, ndefMessage);
//     }
//   }
//
//   void _showNfcSuccessDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('NFC Success'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NFC Manager Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (!isNfcAvailable) Text('NFC is not available on this device.'),
//             if (isNfcAvailable)
//               ElevatedButton(
//                 onPressed: _startNfcSession,
//                 child: Text('Start NFC'),
//               ),
//             if (nfcTag != null)
//               ElevatedButton(
//                 onPressed: _readNfcTag,
//                 child: Text('Read NFC'),
//               ),
//             if (nfcTag != null)
//               ElevatedButton(
//                 onPressed: _writeNfcTag,
//                 child: Text('Write NFC'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
