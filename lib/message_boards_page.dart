import 'package:flutter/material.dart';

class MessageBoardsPage extends StatelessWidget {
  const MessageBoardsPage({super.key});

  // Hard-coded message boards
  final List<Map<String, dynamic>> boards = const [
    {
      'name': 'General Chat',
      'icon': Icons.chat_bubble_outline,
      'color': Colors.deepPurple,
    },
    {
      'name': 'Tech Talk',
      'icon': Icons.computer,
      'color': Colors.blue,
    },
    {
      'name': 'Gaming',
      'icon': Icons.videogame_asset,
      'color': Colors.green,
    },
    {
      'name': 'Movies & TV',
      'icon': Icons.movie,
      'color': Colors.redAccent,
    },
    {
      'name': 'Music',
      'icon': Icons.music_note,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message Boards"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (context, index) {
          final board = boards[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: board['color'],
                child: Icon(
                  board['icon'],
                  color: Colors.white,
                ),
              ),
              title: Text(
                board['name'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to the messages of this board
                // Example:
                // Navigator.pushNamed(context, '/board_messages', arguments: board['name']);
              },
            ),
          );
        },
      ),
    );
  }
}
