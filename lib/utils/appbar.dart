import 'package:flutter/material.dart';
import 'sidebar.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Icon(Icons.local_fire_department),
                SizedBox(width: 4),
                Text('3'),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 1);
}
