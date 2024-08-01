import 'package:flutter/material.dart';
import '.dart'; // Import the second screen

class Page3 extends StatefulWidget {
  @override
  _ProfileCompletionScreenState createState() => _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<ProfileCompletionScreen> {
  double _progress = 0.4;
  String selectedGender = "Male";
  List<String> skills = [
    'Web Development',
    'UI/UX',
    'Data Structures & Algorithm',
    'Technology',
    'AI/ML',
    'Data Analysis',
    'Leadership',
    'Product Engineering'
  ];

  void _incrementProgress() {
    setState(() {
      if (_progress < 1.0) {
        _progress += 0.20; // Increment progress by 20% for each step
      }
    });
  }

  void _addSkill(String skill) {
    setState(() {
      skills.add(skill);
    });
  }

  void _showAddSkillDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddSkillDialog(onAddSkill: _addSkill);
      },
    );
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
                    value: _progress,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            // Progress Text
            Text(
              'You are ${(_progress * 100).toInt()}% there',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            // Skills / Interests
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Skills / Interests',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Skill Chips
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: skills.map((skill) {
                return Chip(
                  label: Text(skill),
                  backgroundColor: Colors.grey[200],
                );
              }).toList() +
              [
                GestureDetector(
                  onTap: _showAddSkillDialog,
                  child: Chip(
                    label: Text(
                      'Add a skill/interest',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    avatar: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
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
                    _incrementProgress();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactInformationScreen(progress: _progress),
                      ),
                    );
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

class AddSkillDialog extends StatefulWidget {
  final Function(String) onAddSkill;

  AddSkillDialog({required this.onAddSkill});

  @override
  _AddSkillDialogState createState() => _AddSkillDialogState();
}

class _AddSkillDialogState extends State<AddSkillDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a Skill/Interest'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Add a Skill/Interest',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Done'),
        ),
        TextButton(
          onPressed: () {
            widget.onAddSkill(_controller.text);
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
