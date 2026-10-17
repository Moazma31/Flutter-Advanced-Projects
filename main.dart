import 'package:flutter/material.dart';

void main() {
  runApp(CrossPlatformApp());
}

class CrossPlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Cross Platform App")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, size: 60),
            SizedBox(height: 20),
            Text(
              "Runs on Android & iOS",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}