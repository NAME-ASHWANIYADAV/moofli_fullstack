import 'package:flutter/material.dart';
import 'package:moofli_fullstack/utils/sidebar.dart';

class Appbar_screen extends StatefulWidget implements PreferredSizeWidget {
  const Appbar_screen({super.key});

  @override
  State<Appbar_screen> createState() => _AppbarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<Appbar_screen> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: CircleAvatar(
                radius: 20, // Adjust the radius as needed
                backgroundImage: AssetImage('images/croc2.jpeg'),
              ));
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 20),
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
    );
  }
}
