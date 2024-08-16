import 'package:flutter/material.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page5.dart';

class ProfessionalInformationPage4 extends StatefulWidget {
  @override
  _ProfessionalInformationPage4State createState() =>
      _ProfessionalInformationPage4State();
}

class _ProfessionalInformationPage4State
    extends State<ProfessionalInformationPage4> {
  double progress = 0.6; // Current progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/moofli_logo.jpg',
                      height: 50), // Placeholder for your logo
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
              // Professional Information Section
              Text(
                "Professional Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildToggleButton("Student"),
                  _buildToggleButton("Professional", isSelected: true),
                ],
              ),
              SizedBox(height: 20.0),
              _buildTextField("College/Institution"),
              _buildTextField("Degree"),
              _buildTextField("Field of Study/Branch"),
              Row(
                children: [
                  Expanded(child: _buildTextField("Start Year")),
                  SizedBox(width: 20.0),
                  Expanded(child: _buildTextField("End Year")),
                ],
              ),
              SizedBox(height: 20.0),
              _buildTextField("Job Title"),
              _buildTextField("Company Name"),
              _buildTextField("Job Description"),
              Row(
                children: [
                  Expanded(child: _buildTextField("Start Year")),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: _buildTextField("End Year", initialValue: "Present"),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
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
                        progress = 0.8; // Update progress for the next page
                      });
                      Navigator.push(context,  MaterialPageRoute(
                        builder: (context) => CoverProfilePhotoPage()));
                      // Implement navigation to the next page
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
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
      ),
    );
  }

  Widget _buildTextField(String label, {String? initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: initialValue != null
            ? TextEditingController(text: initialValue)
            : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.black : Colors.grey[200],
        backgroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
      child: Text(label),
    );
  }
}
