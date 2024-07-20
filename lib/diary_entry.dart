import 'package:flutter/material.dart';




class DiaryEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Row(
          children: [
            Text('Moofli'),
            Spacer(),
                Icon(Icons.local_fire_department),
                Text('3'),
          ],
        ),
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
                      Text(
                        '16 JULY',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text('2024, Sunday'),
                    ],
                  ),
                  
                ],
              ),
              SizedBox(height: 20),
              Container(
                
                width: double.infinity,
                height: 800,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident nihil beatae pariatur fuga suscipit perferendis unde commodi amet vitae asperiores?',
                  style: TextStyle(
                    color: Colors.indigo.shade900,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index){},
                fixedColor: Colors.black,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo_size_select_actual_outlined),
                    label: '',
                    
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.format_bold),
                    label: '',
                    backgroundColor: Colors.black
                    
                  ),
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
