import 'package:flutter/material.dart';
import '../sidebar.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sidebar()),
                    );
                    
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Replace with your image URL
                  ),
                ),
                Text('MOOFLI'),
                Image.asset('images/vector.png'),
                // Text('3'),
              ],
            ),
            Divider(),
        ],
      ),
        
    );
  }
   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}