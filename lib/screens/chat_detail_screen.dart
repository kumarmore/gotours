import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class ChatDetailScreen extends StatelessWidget {
  final String contactName;
  final String contactImage;

  const ChatDetailScreen({
    super.key,
    required this.contactName,
    required this.contactImage,
  });

  @override
  Widget build(BuildContext context) {
    // Sample messages for the conversation
    final List<Map<String, dynamic>> messages = [
      {
        'text': 'Hello, send me the rest youchoice any that.',
        'isMe': false,
        'time': '1:40 AM',
      },
      {
        'text': 'Yer, I’m going to throw',
        'isMe': true,
        'time': '1:43 AM',
      },
      {
        'text': 'Lorem Ipsum is simply dummy',
        'isMe': false,
        'time': '1:40 AM',
      },
      {
        'text': 'It is a long established fact that a reader will be distracted by the readable.',
        'isMe': false,
        'time': '1:40 AM',
      },
      {
        'text': 'Here your your photo pls check it',
        'isMe': true,
        'time': '1:43 AM',
        'images': [
          'assets/images/chat/chatbox/p1.png',
          'assets/images/chat/chatbox/p2.png',
        ],
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
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(contactImage),
              onBackgroundImageError: (exception, stackTrace) {
                print('Failed to load contact image in ChatDetailScreen: $contactImage');
              },
              child: const Icon(Icons.person, size: 40),
            ),
            const SizedBox(width: 12),
            CustomText(
              text: contactName,
              size: 20,
              weight: FontWeight.bold,
              fontFamily: 'Marcellus',
            ),
          ],
        ),
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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isMe = message['isMe'] as bool;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isMe) ...[
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(contactImage),
                            onBackgroundImageError: (exception, stackTrace) {
                              print('Failed to load message profile image: $contactImage');
                            },
                            child: const Icon(Icons.person, size: 30),
                          ),
                          const SizedBox(width: 12),
                        ],
                        Flexible(
                          child: Column(
                            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: isMe ? const Color(0xFFFFE8E1) : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      message['text'] as String,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    if (message.containsKey('images')) ...[
                                      const SizedBox(height: 8),
                                      Row(
                                        children: (message['images'] as List<String>)
                                            .map((imagePath) => Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.asset(
                                              imagePath,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                print('Failed to load message image: $imagePath');
                                                return const Icon(Icons.broken_image, size: 50);
                                              },
                                            ),
                                          ),
                                        ))
                                            .toList(),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                message['time'] as String,
                                style: const TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
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