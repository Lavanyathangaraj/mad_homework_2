// File: message_boards_page.dart

import 'package:flutter/material.dart';
import 'board_messages_page.dart'; // Import the message page

class MessageBoardsPage extends StatelessWidget {
  const MessageBoardsPage({super.key});

  // Updated hard-coded message boards with correct image file extensions
  final List<Map<String, dynamic>> boards = const [
    {
      'name': 'General Chat',
      // Corrected to .jpeg
      'image': 'assets/general_banner.jpeg',
      'color': Colors.deepPurple,
    },
    {
      'name': 'Tech Talk',
      // Corrected to .jpeg
      'image': 'assets/tech_banner.jpeg',
      'color': Colors.blue,
    },
    {
      'name': 'Games', // Added "Games" to match the visual layout
      // Corrected to .avif
      'image': 'assets/games_banner.avif', 
      'color': Colors.red,
    },
    {
      'name': 'Business', // Added "Business" to match the visual layout
      // Corrected to .jpeg
      'image': 'assets/business_banner.jpeg', 
      'color': Colors.teal,
    },
    {
      'name': 'Public Health',
      // Corrected to .png
      'image': 'assets/public_health_banner.png', 
      'color': Colors.pink,
    },
    {
      'name': 'Study',
      // Corrected to .png
      'image': 'assets/study_banner.png', 
      'color': Colors.indigo,
    },
    {
      'name': 'Movies & TV',
      // Corrected to .jpeg
      'image': 'assets/movies_banner.jpeg', 
      'color': Colors.redAccent,
    },
    {
      'name': 'Music',
      // Corrected to .jpeg
      'image': 'assets/music_banner.jpeg', 
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select A Room"), 
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          // This should trigger the Drawer defined in home_page.dart
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu), 
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true, 

      body: ListView.builder(
        // Adjust padding to place content correctly below the App Bar
        padding: const EdgeInsets.only(top: kToolbarHeight + 40.0), 
        itemCount: boards.length,
        itemBuilder: (context, index) {
          final board = boards[index];

          return GestureDetector(
            onTap: () {
              // Navigate to the chat page, passing the board name
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardMessagesPage(
                    boardName: board['name'],
                  ),
                ),
              );
            },
            child: Container(
              height: 200, // Fixed height for each banner
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.asset(
                      board['image'],
                      fit: BoxFit.cover,
                      // Optional: Add a color filter for better text contrast
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black.withOpacity(0.15),
                      // Use an error builder for better debugging if an image fails to load
                      errorBuilder: (context, error, stackTrace) => 
                          Center(child: Text("Error loading image: ${board['name']}", style: const TextStyle(color: Colors.red))),
                    ),
                  ),
                  // Overlay for board name text
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      board['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(150, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}