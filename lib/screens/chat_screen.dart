import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';
import 'chat_detail_screen.dart'; // Import the new ChatDetailScreen

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for chat conversations
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'John Wells',
        'message': 'If you want to experience',
        'time': '9:15 AM',
        'date': '13/12/2020',
        'image': 'assets/images/chat/john.png',
      },
      {
        'name': 'Rosemary Casas',
        'message': 'Hello, can help you...',
        'time': '12:15 AM',
        'date': '13/12/2020',
        'image': 'assets/images/chat/rose.png',
      },
      {
        'name': 'Susan Doolan',
        'message': 'Call me asap',
        'time': '12:15 AM',
        'date': '10/12/2020',
        'image': 'assets/images/chat/susen.png',
      },
      {
        'name': 'Robert B. Sica',
        'message': 'Message text send',
        'time': '8:15 AM',
        'date': '13/12/2020',
        'image': 'assets/images/chat/robert.png',
      },
      {
        'name': 'Liya Julli',
        'message': 'Get well soon',
        'time': '8:15 AM',
        'date': '13/12/2020',
        'image': 'assets/images/chat/liya.png',
      },
      {
        'name': 'Robert Walker',
        'message': 'I am in meeting',
        'time': '8:15 AM',
        'date': '13/12/2020',
        'image': 'assets/images/chat/roobert.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const CustomText(
          text: 'Chat',
          size: 24,
          weight: FontWeight.bold,
          fontFamily: 'Marcellus',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 30),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Message...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Chat List
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to ChatDetailScreen when a chat item is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailScreen(
                            contactName: chat['name'] as String,
                            contactImage: chat['image'] as String,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(chat['image']),
                            onBackgroundImageError: (exception, stackTrace) {
                              print('Failed to load chat profile image: ${chat['image']}');
                            },
                            // child: const Icon(Icons.person, size: 40),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: chat['name'],
                                  size: 16,
                                  weight: FontWeight.bold,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  chat['message'],
                                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                chat['date'],
                                style: const TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                chat['time'],
                                style: const TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}