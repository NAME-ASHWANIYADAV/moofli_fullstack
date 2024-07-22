import 'package:flutter/material.dart';
import 'package:moofli_fullstack/settings.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Ashwani Yaduwanshi'),
                  accountEmail: Text('10 Friends'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    // Handle Profile tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Handle Settings tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
                
                
              ],
            ),
            
          ),
          ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title:
                      Text('Logout Account', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    // Handle Logout tap
                  },
                ),
        ],
      ),
    );
  }
}
