import 'package:flutter/material.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page6.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/skillop_logo_nobg.png',
                  height: 46,
                  width: 46,
                ),
                const Text(
                  "MOOFLI",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Complete your",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 261.6,
                      height: 3,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF108CFF),
                            Color(0xFF0EAB00),
                            Color(0xFFFFB800),
                            Color(0xFFFD0C0C)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 3,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFD9D9ED),
                            Color(0xFFD9D9ED),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You are",
                  style: TextStyle(color: Color.fromARGB(255, 95, 95, 95)),
                ),
                SizedBox(width: 4),
                Text(
                  "80%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 95, 95, 95),
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  "there",
                  style: TextStyle(color: Color.fromARGB(255, 95, 95, 95)),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Cover and Profile Photo Section
            Text(
              "Cover and Profile Photo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(height: 15.0),
            Text(
              "Cover Photo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            SizedBox(height: 8.0),
            Column(
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
                Text(
            "Profile Photo",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        SizedBox(height: 8.0),
                // SizedBox(height: 20.0),
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
            SizedBox(height: 40.0),
            // Navigation Buttons (Skip and Next)
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         // Skip functionality
            //       },
            //       child: Text("Skip for Now",
            //           style: TextStyle(color: Colors.black)),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         setState(() {
            //           progress = 1.0; // Update progress for the next page
            //         });
            //         // Implement navigation to the next page
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => ProfileCompletionScreen6()));
            //       },
            //       style: ElevatedButton.styleFrom(
            //         foregroundColor: Colors.black,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30.0),
            //         ),
            //         padding:
            //             EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            //       ),
            
                  
              
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           Navigator.pop(context); // Navigate back
            //         },
            //         icon: Icon(Icons.arrow_back),
            //       ),
            //       ElevatedButton(
            //         onPressed: () {
            //           setState(() {
            //             progress = 0.8; // Update progress for the next page
            //           });
            //           Navigator.push(context,  MaterialPageRoute(
            //             builder: (context) => CoverProfilePhotoPage()));
            //           // Implement navigation to the next page
            //         },
            //         style: ElevatedButton.styleFrom(
            //           foregroundColor: Colors.black,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30.0),
            //           ),
            //           padding: EdgeInsets.symmetric(
            //               horizontal: 30.0, vertical: 15.0),
            //         ),
            //         child: Row(
            //           children: [
            //             Text('NEXT'),
            //             SizedBox(width: 5.0),
            //             Icon(Icons.arrow_forward),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  TextButton(
                  onPressed: () {
                    // Skip functionality
                  },
                  child: Text("Skip for Now",
                      style: TextStyle(color: Colors.black)),
                ),
                    SizedBox(
                      height: 41,
                      width: 89,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileCompletionScreen6()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100))),
                        child: Image.asset(
                          'images/next.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  // ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
