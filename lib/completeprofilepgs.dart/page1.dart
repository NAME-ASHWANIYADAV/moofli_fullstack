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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 20.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           // // Logo
  //           // Image.network(
  //           //   'https://yourlogo.url', // Replace with your logo URL
  //           //   height: 100.0,
  //           // ),
  //           SizedBox(height: 20.0),
  //           // Complete your Profile Text
  //           RichText(
  //             textAlign: TextAlign.center,
  //             text: TextSpan(
  //               children: [
  //                 TextSpan(
  //                   text: 'Complete your\n',
  //                   style: TextStyle(
  //                     fontSize: 24.0,
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 TextSpan(
  //                   text: 'Profile',
  //                   style: TextStyle(
  //                     fontSize: 24.0,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: 10.0),
  //           // Progress Bar
  //           Row(
  //              children: [
  //               ShaderMask(
  //                 shaderCallback: (bounds) => LinearGradient(
  //                   colors: [Colors.red, Colors.green, Colors.blue],
  //                 ).createShader(bounds),
  //                 child: Container(
  //                   width: 40.0,
  //                   height: 5.0,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               SizedBox(width: 5.0),
  //               Expanded(
  //                 child: LinearProgressIndicator(
  //                   value: progress,
  //                   backgroundColor: Colors.grey[300],
  //                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 5.0),
  //           // Progress Text
  //           Text(
  //             'You are ${(progress * 100).toInt()}% there',
  //             style: TextStyle(
  //               color: Colors.grey,
  //             ),
  //           ),
  //           SizedBox(height: 20.0),
  //           // Personal Information
  //           Align(
  //             alignment: Alignment.centerLeft,
  //             child: Text(
  //               'Personal Information',
  //               style: TextStyle(
  //                 fontSize: 18.0,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 10.0),
  //           // Name TextField
  //           TextField(
  //             decoration: InputDecoration(
  //               hintText: 'Name',
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(10.0),
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 10.0),
  //           // DOB TextField
  //           TextField(
  //             decoration: InputDecoration(
  //               hintText: 'DOB',
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(10.0),
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 10.0),
  //           // Gender Selection
  //           Align(
  //             alignment: Alignment.centerLeft,
  //             child: Text(
  //               'Gender',
  //               style: TextStyle(
  //                 fontSize: 16.0,
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 10.0),
  //           Row(
  //             children: [
  //               GenderButton(
  //                 text: 'Male',
  //                 isSelected: selectedGender == 'Male',
  //                 onTap: () {
  //                   setState(() {
  //                     selectedGender = 'Male';
  //                   });
  //                 },
  //               ),
  //               SizedBox(width: 10.0),
  //               GenderButton(
  //                 text: 'Female',
  //                 isSelected: selectedGender == 'Female',
  //                 onTap: () {
  //                   setState(() {
  //                     selectedGender = 'Female';
  //                   });
  //                 },
  //               ),
  //               SizedBox(width: 10.0),
  //               GenderButton(
  //                 text: 'Rather Not Say',
  //                 isSelected: selectedGender == 'Rather Not Say',
  //                 onTap: () {
  //                   setState(() {
  //                     selectedGender = 'Rather Not Say';
  //                   });
  //                 },
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 20.0),
  //           // Navigation Buttons
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               IconButton(  
  //                 onPressed: () {},
  //                 icon: Icon(Icons.arrow_back),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   _incrementProgress();
  //                    Navigator.push(
  //                      context,
  //                      MaterialPageRoute(
  //                        builder: (context) => ContactInformationScreen(progress: progress),
  //                    ),
  //                  );
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   foregroundColor: Colors.black,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(30.0),
  //                   ),
  //                   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
  //                 ),
                  
  //                 child: Row(
  //                   children: [
  //                     Text('NEXT'),
  //                     SizedBox(width: 5.0),
  //                     Icon(Icons.arrow_forward),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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
                            width: 8,
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
                            width: 325,
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
                        "0%",
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
                  const SizedBox(height: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'dd-mm-yy',
                      labelText: 'DOB',
                    ),
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                      alignment: Alignment(-0.90, 0), child: Text("Gender")),
                  //buttons
                  //male
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
                      const SizedBox(width: 5),
                      GenderButton(
                        text: 'Female',
                        isSelected: selectedGender == 'Female',
                        onTap: () {
                          setState(() {
                            selectedGender = 'Female';
                          });
                        },
                      ),
                      const SizedBox(width: 5),
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
                  // back button
                  const SizedBox(height: 180),
                  Row(
                    children: [
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: Image.asset(
                            'images/back.jpeg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 212,
                      ),
                      // Next button
                      SizedBox(
                        height: 41,
                        width: 89,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactInformationScreen(progress:progress)),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
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
