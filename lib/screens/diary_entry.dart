import 'package:flutter/material.dart';
import 'package:moofli_fullstack/constants/global_variables.dart';
import 'package:moofli_fullstack/provider_class/userprovider.dart';
import 'package:moofli_fullstack/utils/sidebar.dart';
// import 'package:moofli_fullstack/utils/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';



class Diaryentry extends StatefulWidget {
  @override
  _DiaryentryState createState() => _DiaryentryState();
}

class _DiaryentryState extends State<Diaryentry> with WidgetsBindingObserver {




  
 TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _saveDiaryEntry();
    }
  }

  void _saveDiaryEntry() async {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    String content = _contentController.text.trim();

    if (content.isNotEmpty) {
      var url = Uri.parse('$uri/diary/entries');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode({'content': content}),
        
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['result'] == true) {
          // Diary entry submitted successfully
          print('Diary entry submitted: $content');

          // Optionally, show a success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Diary entry saved successfully!')),
          );
        } else {
          // Show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save diary entry.')),
          );
        }
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save diary entry.')),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: CircleAvatar(
                radius: 15, // Adjust the radius to fit your design
                backgroundImage: AssetImage(
                    'images/croc2.jpeg'), // Path to your profile image
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            Row(
              children: [
                Image.asset('images/moofli_logo.jpg',
                    height: 24), // Change this to your logo
                SizedBox(width: 8),
                Text('MOOFLI'),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.local_fire_department,
                  // color: newPost ? Colors.red : Colors.black,
                ),
                SizedBox(width: 4),
                Text('0'),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                children: [
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with your image URL
                  // ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '16 ',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'JULY',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '2024, Sunday',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
               
                 ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 800,
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF4E6CD7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _contentController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'What\'s on your mind?',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
            ],
          ),
            
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
       
        fixedColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_size_select_actual_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_bold),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_italic),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_underline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_left),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_center),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_right),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_justify),
            label: '',
          ),
        ],
      ),
    );
  }
}
