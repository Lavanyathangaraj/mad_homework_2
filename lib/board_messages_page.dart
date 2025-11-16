// File: board_messages_page.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BoardMessagesPage extends StatelessWidget {
  final String boardName;

  const BoardMessagesPage({super.key, required this.boardName});

  // Function to return hardcoded messages based on the boardName
  List<Map<String, dynamic>> _getBoardMessages() {
    switch (boardName) {
      case 'General Chat':
        return const [
          {
            'userName': 'Alice',
            'text': 'Welcome to the message board! What are your favorite topics?',
            'timestamp': '2025-11-15T10:00:00Z',
            'isMe': false,
          },
          {
            'userName': 'Bob',
            'text': 'I am new here. Mostly interested in Tech Talk and Gaming!',
            'timestamp': '2025-11-15T10:05:00Z',
            'isMe': false,
          },
          {
            'userName': 'You (Current User)',
            'text': 'Glad to have you, Bob! We have great threads on both.',
            'timestamp': '2025-11-15T10:10:00Z',
            'isMe': true,
          },
          {
            'userName': 'Alice',
            'text': 'Just curious, what brings everyone to this specific app?',
            'timestamp': '2025-11-15T10:15:00Z',
            'isMe': false,
          },
          {
            'userName': 'Charlie',
            'text': 'I love the simple interface and the focus on core communities.',
            'timestamp': '2025-11-15T10:20:00Z',
            'isMe': false,
          },
        ];
      
      case 'Tech Talk':
        return const [
          {
            'userName': 'Eve',
            'text': 'Has anyone looked into Flutter 4.0? I hear the performance is insane.',
            'timestamp': '2025-11-15T14:30:00Z',
            'isMe': false,
          },
          {
            'userName': 'You (Current User)',
            'text': 'Not yet! Is the new rendering engine stable for production?',
            'timestamp': '2025-11-15T14:35:00Z',
            'isMe': true,
          },
          {
            'userName': 'David',
            'text': 'Yes, and the new dart features simplify asynchronous programming a lot.',
            'timestamp': '2025-11-15T14:40:00Z',
            'isMe': false,
          },
          {
            'userName': 'Eve',
            'text': 'I read an article about how they drastically reduced startup latency. Worth the upgrade!',
            'timestamp': '2025-11-15T14:45:00Z',
            'isMe': false,
          },
          {
            'userName': 'David',
            'text': 'Agreed! My older apps feel snappier already.',
            'timestamp': '2025-11-15T14:50:00Z',
            'isMe': false,
          },
        ];

      case 'Gaming':
        return const [
          {
            'userName': 'GamerGirl',
            'text': 'Speaking of gaming, has anyone tried the new "Elden Ring" expansion?',
            'timestamp': '2025-11-16T08:00:00Z',
            'isMe': false,
          },
          {
            'userName': 'Bob',
            'text': 'It\'s tough! The new bosses are brutal. Worth every penny though.',
            'timestamp': '2025-11-16T08:05:00Z',
            'isMe': false,
          },
          {
            'userName': 'You (Current User)',
            'text': 'I’m stuck on the dual sentinel fight. Any tips for a magic build?',
            'timestamp': '2025-11-16T08:10:00Z',
            'isMe': true,
          },
          {
            'userName': 'GamerGirl',
            'text': 'Try the Night Comet sorcery; it absolutely melts them if you position correctly!',
            'timestamp': '2025-11-16T08:15:00Z',
            'isMe': false,
          },
          {
            'userName': 'Bob',
            'text': 'Good shout. Also, don\'t forget to use your summons as a distraction.',
            'timestamp': '2025-11-16T08:20:00Z',
            'isMe': false,
          },
          {
            'userName': 'GamerGirl',
            'text': 'True, Tiche is my favorite spirit summon for that fight.',
            'timestamp': '2025-11-16T08:25:00Z',
            'isMe': false,
          },
        ];

      case 'Movies & TV':
        return const [
          {
            'userName': 'Cinaphile',
            'text': 'Did anyone catch the latest sci-fi release? The cinematography was stunning.',
            'timestamp': '2025-11-16T11:00:00Z',
            'isMe': false,
          },
          {
            'userName': 'You (Current User)',
            'text': 'The plot twist at the end totally caught me off guard!',
            'timestamp': '2025-11-16T11:05:00Z',
            'isMe': true,
          },
          {
            'userName': 'Sarah',
            'text': 'I thought the pacing dragged a bit in the middle, but the final act was excellent.',
            'timestamp': '2025-11-16T11:10:00Z',
            'isMe': false,
          },
          {
            'userName': 'Cinaphile',
            'text': 'Totally agree on the pacing. What are we watching next?',
            'timestamp': '2025-11-16T11:15:00Z',
            'isMe': false,
          },
          {
            'userName': 'Sarah',
            'text': 'The new historical drama on Netflix is getting rave reviews. Should we start a watch party thread?',
            'timestamp': '2025-11-16T11:20:00Z',
            'isMe': false,
          },
        ];

      case 'Music':
        return const [
          {
            'userName': 'DJ_Beat',
            'text': 'New electronic album drop today. Definitely check out track 5.',
            'timestamp': '2025-16-11T16:00:00Z',
            'isMe': false,
          },
          {
            'userName': 'Guitar_Guy',
            'text': 'I\'m more into rock. Any recommendations for new indie bands?',
            'timestamp': '2025-16-11T16:05:00Z',
            'isMe': false,
          },
          {
            'userName': 'DJ_Beat',
            'text': 'Check out "The Echo Chamber." They have a really unique sound blending 80s synth with heavy guitar riffs.',
            'timestamp': '2025-16-11T16:10:00Z',
            'isMe': false,
          },
          {
            'userName': 'You (Current User)',
            'text': 'I love that band! Their new single is currently on repeat for me.',
            'timestamp': '2025-16-11T16:15:00Z',
            'isMe': true,
          },
        ];

      default:
        return const [
          {
            'userName': 'System',
            'text': 'No hardcoded messages available for this board.',
            'timestamp': '2025-01-01T00:00:00Z',
            'isMe': false,
          },
        ];
    }
  }


  @override
  Widget build(BuildContext context) {
    // Retrieve messages specific to the current board
    final List<Map<String, dynamic>> rawMessages = _getBoardMessages();

    // 1. Convert timestamp strings to DateTime objects for sorting and formatting
    final List<Map<String, dynamic>> messages = rawMessages.map((msg) {
      return {
        ...msg,
        'dateTime': DateTime.parse(msg['timestamp']),
      };
    }).toList();

    // 2. Sort the messages by time (ascending) to display them in chronological order
    messages.sort((a, b) => a['dateTime'].compareTo(b['dateTime']));

    return Scaffold(
      appBar: AppBar(
        title: Text(boardName), 
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        reverse: true, // Display newest message at the bottom
        itemCount: messages.length,
        itemBuilder: (context, index) {
          // Iterate from the end of the sorted list due to reverse: true
          final message = messages[messages.length - 1 - index];
          
          final String messageText = message['text'];
          final String userName = message['userName'];
          final DateTime dateTime = message['dateTime'];
          final String formattedTime = DateFormat('h:mm a').format(dateTime);
          final bool isMe = message['isMe'];

          return Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isMe ? Colors.deepPurple.shade100 : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontWeight: FontWeight.bold, color: isMe ? Colors.deepPurple : Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Text(messageText, style: TextStyle(color: isMe ? Colors.black87 : Colors.black)),
                  const SizedBox(height: 4),
                  Text(
                    formattedTime,
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
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