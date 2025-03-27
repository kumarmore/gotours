import 'package:flutter/material.dart';
import 'explore_page.dart';
import '../screens/payment_method_screen.dart';
import '../screens/chat_screen.dart';
import '../widgets/build_card.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ExplorePage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Map',
          style: TextStyle(
            fontFamily: "Marcellus",
            fontSize: 32.0, // Updated to match MainScreen
            fontWeight: FontWeight.bold, // Updated to match MainScreen
            color: Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.deepOrangeAccent.shade100,
                radius: 24,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png', // Path to your asset image
                    fit: BoxFit.cover,
                    width: 48,
                    height: 48,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        size: 48,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Color(0xffFF7D0D),
                  radius: 6,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Color(0xffFF7D0D),
                  radius: 6,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 25.0,
          bottom: 8.0,
          right: 16.0,
          left: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xffFF7D0D)),
                      ),
                      hintText: 'Find your location...',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Gilroy-Medium',
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xffFF7D0D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'My Location',
              style: TextStyle(
                fontFamily: "Gilroy-Bold",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BuildCard(
                    imageUrl:
                    'https://images.pexels.com/photos/1368502/pexels-photo-1368502.jpeg', // Updated to match reference
                    title: 'Winter in Portugal',
                    description:
                    "Portugal there's so much more to discover. Read about the Azores' new wave of eco-travel.",
                    isBookmarked: true,
                    location: 'Lisbon',
                  ),
                  const SizedBox(width: 16),
                  BuildCard(
                    imageUrl:
                    'https://images.pexels.com/photos/402028/pexels-photo-402028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', // Japan image
                    title: 'Japan Most Unique Country',
                    description:
                    "Japan offers a perfect blend of tradition and innovation. Discover serene temples, vibrant cities",
                    location: 'Sesimbra, Lisbon',
                    isBookmarked: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Container(
            //     height: 250,
            //     width: double.infinity, // Set width to fit the desired layout
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade200,
            //       image: const DecorationImage(
            //         image: AssetImage('assets/images/img.png'), // Path to your asset image
            //         fit: BoxFit.fill, // Adjust the image's scaling behavior
            //       ),
            //     ),
            //   ),
            // ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 250,
                width: double.infinity, // Set width to fit the desired layout
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  image: const DecorationImage(
                    image: NetworkImage('https://media.assettype.com/thebridgechronicle%2F2024-07%2F6a0dfb90-d93a-437b-ad13-14c1ffc1a137%2Fgoogle%20traffic%20police.png?w=1024&auto=format%2Ccompress&fit=max'), // URL of your network image
                    fit: BoxFit.fill, // Adjust the image's scaling behavior
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffFF7D0D),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 3, // Highlight the location icon
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: ''),
        ],
      ),
    );
  }
}