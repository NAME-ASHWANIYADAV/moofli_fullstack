import 'package:flutter/material.dart';
import 'package:moofli_fullstack/screens/home.dart';



class ProfileCompletionScreen6 extends StatefulWidget {
  @override
  State<ProfileCompletionScreen6> createState() => _ProfileCompletionScreen6State();
}

class _ProfileCompletionScreen6State extends State<ProfileCompletionScreen6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                'images/moofli_logo.jpg', // replace with your logo asset path
                height: 50,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Complete your",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "You are 100% there",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'LinkedIn Profile',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'UPI Id',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context,  MaterialPageRoute(
                        builder: (context) => home_page()));
                // Action on Finish button pressed
              },
              child: Text('FINISH'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Action on back button pressed
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
