import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://www.example.com/profile_image.jpg'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.star, color: Colors.yellow),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'France Leaphart',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text('B.Tech CSE@DTU | DSA | Web Development'),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    '10 Friends',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Handle LinkedIn profile link tap
                    },
                    child: Text(
                      'www.linkedin.com/in/france-leaphart',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit Profile'),
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                sectionTitle('ABOUT'),
                sectionContent(
                    'Lorem Ipsum Dolor Sit Amet Consectetur. Id Lobortis Ut Gravida Scelerisque Vivamus Nec. Urna Auctor Semper Quam Placera Et. Urna Rhoncus Morbi Nunc Et Urna Dolor Id. Vitae Natoque Leo Justo Eget Amet Quis.'),
                Divider(),
                sectionTitle('Past Experience'),
                sectionContent(
                    'Lorem Ipsum Dolor Sit Amet Consectetur. Id Lobortis Ut Gravida Scelerisque Vivamus Nec. Urna Auctor Semper Quam Placera Et. Urna Rhoncus Morbi Nunc Et Urna Dolor Id. Vitae Natoque Leo Justo Eget Amet Quis.'),
                Divider(),
                sectionTitle('Future Plans'),
                sectionContent(
                    'Lorem Ipsum Dolor Sit Amet Consectetur. Id Lobortis Ut Gravida Scelerisque Vivamus Nec. Urna Auctor Semper Quam Placera Et. Urna Rhoncus Morbi Nunc Et Urna Dolor Id. Vitae Natoque Leo Justo Eget Amet Quis.'),
                Divider(),
                sectionTitle('EXPERIENCE'),
                experienceContent(
                    'Software Development Intern',
                    'Flipkart',
                    'May 23 - Nov 23',
                    'Lorem Ipsum Dolor Sit Amet Consectetur. Id Lobortis Ut Gravida Scelerisque Vivamus Nec.'),
                experienceContent(
                    'DevFest Organizing Team Member',
                    'Google For Developers',
                    'Oct 23 - Nov 23',
                    'Lorem Ipsum Dolor Sit Amet Consectetur. Id Lobortis Ut Gravida Scelerisque Vivamus Nec.'),
                Divider(),
                sectionTitle('SKILLS'),
                skillChips(
                    ['Web Development', 'Technology', 'DSA', 'UI/UX Design']),
                Divider(),
                sectionTitle('EDUCATION'),
                educationContent('Delhi Technological University',
                    'North West, Delhi', 'Jul 23 - Jul 27', 'Btech - CSE'),
                educationContent(
                    'Mount Abu Public School',
                    'Sector-5, Rohini, Delhi',
                    'Oct 23 - Nov 23',
                    'Grade 1 - 12'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/bold.jpg')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/bold.jpg')),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget sectionContent(String content) {
    return Text(
      content,
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget experienceContent(
      String role, String company, String duration, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            role,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            company,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            duration,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget skillChips(List<String> skills) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: skills.map((skill) => Chip(label: Text(skill))).toList(),
    );
  }

  Widget educationContent(
      String institution, String location, String duration, String degree) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            institution,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            location,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            duration,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            degree,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
