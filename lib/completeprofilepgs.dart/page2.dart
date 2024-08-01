import 'package:flutter/material.dart';

class ContactInformationScreen extends StatelessWidget {
  final double progress;

  ContactInformationScreen({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.network(
              'https://yourlogo.url', // Replace with your logo URL
              height: 100.0,
            ),
            SizedBox(height: 20.0),
            // Complete your Profile Text
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Complete your\n',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Profile',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            // Progress Bar
            Row(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [Colors.red, Colors.green, Colors.blue],
                  ).createShader(bounds),
                  child: Container(
                    width: 40.0,
                    height: 5.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5.0),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress + 0.20,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            // Progress Text
            Text(
              'You are ${((progress + 0.20) * 100).toInt()}% there',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            // Contact Information
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Phone Number TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Email TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // City TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logic for completing profile can go here
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  ),
                  child: Row(
                    children: [
                      Text('NEXT'),
                      SizedBox(width: 5.0),
                      Icon(Icons.arrow_forward),
                    ],
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
