import 'package:flutter/material.dart';
import 'message_boards_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _currentPage = const MessageBoardsPage();
  String _title = "Message Boards";

  void _selectPage(String page) {
    Navigator.pop(context); // Close drawer

    setState(() {
      if (page == 'Message Boards') {
        _currentPage = const MessageBoardsPage();
        _title = "Message Boards";
      } else if (page == 'Profile') {
        _currentPage = const ProfilePage();
        _title = "Profile";
      } else if (page == 'Settings') {
        _currentPage = const SettingsPage();
        _title = "Settings";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text("Message Boards"),
              onTap: () => _selectPage('Message Boards'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () => _selectPage('Profile'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () => _selectPage('Settings'),
            ),
          ],
        ),
      ),
      body: _currentPage,
    );
  }
}
