import 'package:flutter/material.dart';
import '../screens/main_screen.dart';
import '../screens/choice_date_screen.dart';
import '../screens/select_date_screen.dart';
import '../screens/upcoming_tour_screen.dart';
import '../screens/discover_page.dart';
import '../screens/map_page.dart';
import '../screens/hot_place_page.dart';
import '../screens/chat_screen.dart';
import '../screens/payment_method_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/profile_screen.dart';
import '../widgets/explore_page_my_location_widget.dart';
import '../widgets/custom_text.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      // Already on ExplorePage, no action needed
    } else if (index == 1) {
      // Navigate to a FavoritesScreen (placeholder)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoritesScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MapPage()),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffFF7D0D),
              ),
              child: CustomText(
                text: 'Travel App Menu',
                size: 24,
                weight: FontWeight.bold,
                fontFamily: 'Marcellus',
                color: Colors.white,
              ),
            ),
            ListTile(
              title: const CustomText(
                text: 'Main Screen',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Choice Date',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChoiceDatePage()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Select Date',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectDatePage()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Upcoming Tour',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UpcomingTourPage()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Discover',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DiscoverPage()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Explore',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Already on ExplorePage, no navigation needed
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Map',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Hot Place',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HotPlacePage()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Chat',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Payment Method',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Payment',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentScreen()),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Profile',
                size: 16,
                fontFamily: 'Gilroy-Medium',
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, size: 30),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              ),
            ),
            const Text(
              "Explore",
              style: TextStyle(
                fontFamily: "Marcellus",
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              radius: screenHeight * 0.025,
              backgroundImage: const NetworkImage(
                'https://via.placeholder.com/150', // Replace with a network image
              ),
              onBackgroundImageError: (exception, stackTrace) {
                print('Failed to load profile image');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipOval(
                      child: Image.network(
                        // Japan
                        "https://images.pexels.com/photos/402028/pexels-photo-402028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 63,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                    ClipOval(
                      child: Image.network(
                        // Switzerland
                        "https://images.pexels.com/photos/1586298/pexels-photo-1586298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 63,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                    ClipOval(
                      child: Image.network(
                        // Nepal
                        "https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 63,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                    ClipOval(
                      child: Image.network(
                        // India
                        "https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 63,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                    ClipOval(
                      child: Image.network(
                        // Australia
                        "https://images.pexels.com/photos/1878293/pexels-photo-1878293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 63,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "My Location",
                  style: TextStyle(
                    fontFamily: "Gilroy-Bold",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ExplorePageMyLocationWidget(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        title: "Sesimbra & Arrábida",
                        description:
                        "Portugal there’s so much more to discover. Read about the Azores’ new wave of eco-travel.",
                        location: "Sesimbra, Lisbon",
                        imageUrl:
                        "https://images.pexels.com/photos/1368502/pexels-photo-1368502.jpeg",
                        price: '3000',
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      ExplorePageMyLocationWidget(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        title: "Vietnam",
                        price: "4000",
                        description:
                        "Portugal there’s so much more to discover. Read about the Azores’ new wave of eco-travel.",
                        location: "Rondom, Vietnam",
                        imageUrl:
                        "https://images.pexels.com/photos/315191/pexels-photo-315191.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", // Replaced with a working Pexels URL
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Add some padding at the bottom
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffFF7D0D),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0, // Highlight the explore icon
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

// Placeholder for FavoritesScreen
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: const Center(child: Text("Favorites Screen")),
    );
  }
}