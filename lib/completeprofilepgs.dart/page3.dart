import 'package:flutter/material.dart';

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
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(width: 10.0),
                Text("${(progress * 100).toInt()}% there"),
              ],
            ),
            SizedBox(height: 20.0),
            // Skills/Interests Section
            Text(
              "Skills / Interests",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
            Spacer(),
            // Navigation Buttons (Back and Next)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      progress = 0.6; // Update progress for the next page
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
