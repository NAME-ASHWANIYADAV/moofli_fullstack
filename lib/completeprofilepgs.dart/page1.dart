import 'package:flutter/material.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page2.dart';


class ProfileCompletionScreen extends StatefulWidget {
  @override
  _ProfileCompletionScreenState createState() => _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<ProfileCompletionScreen> {
  double progress = 0.0;
  String selectedGender = "Male";

  void _incrementProgress() {
    setState(() {
      if (progress < 1.0) {
        progress += 0.20; // Increment progress by 20% for each step
      }
    });
  }

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
                    value: progress,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            // Progress Text
            Text(
              'You are ${(progress * 100).toInt()}% there',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            // Personal Information
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Name TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // DOB TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'DOB',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Gender Selection
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Gender',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                GenderButton(
                  text: 'Male',
                  isSelected: selectedGender == 'Male',
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                ),
                SizedBox(width: 10.0),
                GenderButton(
                  text: 'Female',
                  isSelected: selectedGender == 'Female',
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                ),
                SizedBox(width: 10.0),
                GenderButton(
                  text: 'Rather Not Say',
                  isSelected: selectedGender == 'Rather Not Say',
                  onTap: () {
                    setState(() {
                      selectedGender = 'Rather Not Say';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: () {
                    // _incrementProgress();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ContactInformationScreen(progress: progress),
                    //   ),
                    // );
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

class GenderButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;

  GenderButton({required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.black : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
            color: isSelected ? Colors.black : Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
