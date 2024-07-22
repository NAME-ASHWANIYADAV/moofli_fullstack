import 'package:flutter/material.dart';
import 'package:moofli_fullstack/utils/appbar.dart';
import 'sidebar.dart';
class DiaryEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onTap: (index) {},
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
