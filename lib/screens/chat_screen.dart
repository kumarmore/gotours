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
        'message': 'Message text send',
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
        'message': 'Message text send',
        'time': '8:15 AM',
        'date': '13/12/2020',
        'image': 'assets/images/chat/liya.png',
      },
      {
        'name': 'Robert Walker',
        'message': 'Message text send',
        'time': '8:15 AM',
        'date': '13/12/2020',
        'image': 'assets/images/chat/roobert.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/profile/profile.png',
              width: 40,
              height: 45,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.person, size: 40);
              },
            ),
          ),
        ),
        title: const CustomText(
          text: 'Chat',
          size: 26,
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
            SizedBox(height: 40,),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Message...',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Gilroy-Medium',
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF7D0D), // Orange background
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white, // White search icon
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Chat List
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return Column(
                    children: [
                      GestureDetector(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  chat['image'],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.person, size: 40);
                                  },
                                ),
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
                                      fontFamily: 'Gilroy-Bold',
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      chat['message'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: 'Gilroy-Medium',
                                      ),
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
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: 'Gilroy-Medium',
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    chat['time'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: 'Gilroy-Medium',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Add a divider after each chat item except the last one
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            color: Colors.grey[300],
                            thickness: 0.5,
                          ),
                        ),
                    ],
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