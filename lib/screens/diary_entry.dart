import 'package:flutter/material.dart';
import 'package:moofli_fullstack/utils/sidebar.dart';
import 'package:moofli_fullstack/utils/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



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
    String content = _contentController.text.trim();

    if (content.isNotEmpty) {
      var url = Uri.parse('http://10.0.2.2:2024/api/diary/entries');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmEwYTc3MmI5MzZmNmM1ZDFmYzA3YzQiLCJpYXQiOjE3MjE4MDQ2NTksImV4cCI6MTcyMjQwOTQ1OX0.7tCsTXOSkXu9nci3dWPJWWHb2Ul05GK6n9DEPJKU_QE',
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
      appBar: Appbar(),
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
