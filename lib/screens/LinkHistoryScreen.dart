import 'package:flutter/material.dart';

class LinkHistoryScreen extends StatefulWidget {
  const LinkHistoryScreen({Key? key}) : super(key: key);

  @override
  _LinkHistoryScreenState createState() => _LinkHistoryScreenState();
}

class _LinkHistoryScreenState extends State<LinkHistoryScreen> {
  List<String> savedLinks = []; // List to store saved links

  TextEditingController linkController1 = TextEditingController();
  TextEditingController linkController2 = TextEditingController();
  TextEditingController linkController3 = TextEditingController();
  TextEditingController linkController4 = TextEditingController();

  // Function to add a link to the saved links list
  void _addLink(String link) {
    setState(() {
      savedLinks.add(link);
    });
  }

  // Function to clear the saved links list
  void _clearHistory() {
    setState(() {
      savedLinks.clear();
      linkController1.clear();
      linkController2.clear();
      linkController3.clear();
      linkController4.clear();
    });
  }

  Widget _expandedButton(String label, Function onPressed) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF000000), // Accents
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFFF7F9F7),
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link History'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Links:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 10),
            // // Display saved links using ListView.builder
            // savedLinks.isEmpty
            //     ? Text('No saved links.')
            //     : ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: savedLinks.length,
            //         itemBuilder: (context, index) {
            //           return Text(savedLinks[index]);
            //         },
            //       ),
            // SizedBox(height: 20),
            // Text(
            //   'Saved Links Placeholder:',
            //   style: TextStyle(
            //     fontSize: 16,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(height: 10),
            TextFormField(
              controller: linkController1,
              decoration: const InputDecoration(
                // hintText: 'Enter a saved link',
                filled: true,
                fillColor: Colors.blueGrey,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: linkController2,
              decoration: const InputDecoration(
                //   hintText: 'Enter a saved link',
                filled: true,
                fillColor: Colors.blueGrey,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: linkController3,
              decoration: const InputDecoration(
                //   hintText: 'Enter a saved link',
                filled: true,
                fillColor: Colors.blueGrey,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: linkController4,
              decoration: const InputDecoration(
                // hintText: 'Enter a saved link',
                filled: true,
                fillColor: Colors.blueGrey,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 150),
            ElevatedButton(
              onPressed: () {
                // Implement behavior for the "Tap Your Product" button
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Background color
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tap Your Product'),
                  Icon(Icons.wifi),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _clearHistory(); // Call the function to clear saved links
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Background color
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Clear History'),
                  Icon(Icons.clear),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
