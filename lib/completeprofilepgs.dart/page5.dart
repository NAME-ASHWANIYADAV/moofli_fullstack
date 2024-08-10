import 'package:flutter/material.dart';



class CoverProfilePhotoPage extends StatefulWidget {
  @override
  CoverProfilePhotoPageState createState() => CoverProfilePhotoPageState();
}

class CoverProfilePhotoPageState extends State<CoverProfilePhotoPage> {
  double progress = 0.8; // Current progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 50), // Placeholder for your logo
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              "Complete your",
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              "Profile",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            // Progress Bar
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(width: 10.0),
                Text("${(progress * 100).toInt()}% there"),
              ],
            ),
            SizedBox(height: 20.0),
            // Cover and Profile Photo Section
            Text(
              "Cover and Profile Photo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Column(
                children: [
                  // Cover Photo Upload
                  GestureDetector(
                    onTap: () {
                      // Implement the upload functionality here
                    },
                    child: Container(
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_rounded, size: 30.0),
                            SizedBox(height: 5.0),
                            Text("UPLOAD", style: TextStyle(fontSize: 16.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Profile Photo Upload
                  GestureDetector(
                    onTap: () {
                      // Implement the upload functionality here
                    },
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_rounded, size: 30.0),
                            SizedBox(height: 5.0),
                            Text("UPLOAD", style: TextStyle(fontSize: 16.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            // Navigation Buttons (Skip and Next)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Skip functionality
                  },
                  child: Text("Skip for Now", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      progress = 1.0; // Update progress for the next page
                    });
                    // Implement navigation to the next page
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
