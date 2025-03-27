import 'package:flutter/material.dart';
import '../screens/hot_place_page.dart';
import '../screens/payment_method_screen.dart';
import '../screens/chat_screen.dart';
import '../widgets/explore_card.dart';

class ExploreClass1 extends StatelessWidget { // Updated class name
  const ExploreClass1({super.key});

  void _onItemTapped(BuildContext context, int index) {
    if (index == 2) {
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
          'Explore',
          style: TextStyle(
            fontFamily: "Marcellus",
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
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
                  child: Image.network(
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
            const SizedBox(height: 10),
            ExploreCard(
              imageUrl:
              'https://images.pexels.com/photos/1368502/pexels-photo-1368502.jpeg',
              title: 'Winter in Portugal',
              location: 'Lisbon',
              price: '3 000',
              days: '7 day',
              season: 'winter',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HotPlacePage()),
                );
              },
            ),
            const SizedBox(height: 10),
            ExploreCard(
              imageUrl:
              'https://images.pexels.com/photos/1368502/pexels-photo-1368502.jpeg', // Same image as above for Sesimbra
              title: 'Sesimbra e Arrabida',
              location: 'Sesimbra, Lisbon',
              price: '2 000',
              days: '3 day',
              season: 'summer',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HotPlacePage()),
                );
              },
            ),
            const SizedBox(height: 10),
            ExploreCard(
              imageUrl:
              'https://images.pexels.com/photos/402028/pexels-photo-402028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              title: 'Japan Most Unique Country',
              location: 'Sesimbra, Lisbon',
              price: '3 000',
              days: '3 day',
              season: 'winter',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HotPlacePage()),
                );
              },
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
        currentIndex: 0,
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
