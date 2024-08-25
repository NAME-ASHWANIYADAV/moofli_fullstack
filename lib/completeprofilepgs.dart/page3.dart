import 'package:flutter/material.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page4.dart';

class ProfileCompletionPage3 extends StatefulWidget {
  @override
  ProfileCompletionPage3State createState() => ProfileCompletionPage3State();
}

class ProfileCompletionPage3State extends State<ProfileCompletionPage3> {
  double progress = 0.4; // Current progress
  List<String> skills = [
    "Web Development",
    "AI/ML",
    "Technology",
  ]; // List of skills/interests

  void _showAddSkillDialog() {
    TextEditingController skillController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add a Skill/Interest",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: skillController,
                  decoration: InputDecoration(
                    hintText: "Add a Skill/Interest",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (skillController.text.isNotEmpty) {
                          setState(() {
                            skills.add(skillController.text);
                          });
                        }
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text("Add"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text("Done"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // Header
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Image.asset('images/moofli_logo.jpg',
  //                   height: 50), // Placeholder for your logo
  //             ],
  //           ),
  //           SizedBox(height: 20.0),
  //           Text(
  //             "Complete your",
  //             style: TextStyle(fontSize: 24.0),
  //           ),
  //           Text(
  //             "Profile",
  //             style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: 10.0),
  //           // Progress Bar
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: LinearProgressIndicator(
  //                   value: progress,
  //                   backgroundColor: Colors.grey[300],
  //                   color: Colors.redAccent,
  //                 ),
  //               ),
  //               SizedBox(width: 10.0),
  //               Text("${(progress * 100).toInt()}% there"),
  //             ],
  //           ),
  //           SizedBox(height: 20.0),
  //           // Skills/Interests Section
  //           Text(
  //             "Skills / Interests",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
  //           ),
  //           SizedBox(height: 10.0),
  //           Wrap(
  //             spacing: 10.0,
  //             runSpacing: 10.0,
  //             children: [
  //               ...skills.map((skill) => Chip(label: Text(skill))).toList(),
  //               GestureDetector(
  //                 onTap: _showAddSkillDialog,
  //                 child: Chip(
  //                   label: Text("Add a skill/Interest"),
  //                   avatar: Icon(Icons.add),
  //                   backgroundColor: Colors.grey[200],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Spacer(),
  //           // Navigation Buttons (Back and Next)
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               IconButton(
  //                 onPressed: () {
  //                   Navigator.pop(context); // Navigate back
  //                 },
  //                 icon: Icon(Icons.arrow_back),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     progress = 0.6; // Update progress for the next page
  //                   });
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) =>
  //                               ProfessionalInformationPage4()));
  //                   // Implement navigation to the next page
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   foregroundColor: Colors.black,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(30.0),
  //                   ),
  //                   padding:
  //                       EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
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
      body: Padding(
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
                          width: 130.8,
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
                          width: 202,
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
                      "40%",
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
                      "Skills / Interest",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                ...skills.map((skill) => Chip(label: Text(skill))).toList(),
                GestureDetector(
                  onTap: _showAddSkillDialog,
                  child: Chip(
                    label: Text("Add a skill/Interest"),
                    avatar: Icon(Icons.add),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
            
                // back button
                const SizedBox(height: 170),
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
                              builder: (context) => ProfessionalInformationPage4()),
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
    );
  }
}
