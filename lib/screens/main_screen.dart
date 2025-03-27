// below code is without drawer---------------------------------------------------------

// import 'package:flutter/material.dart';
// import '../screens/payment_method_screen.dart';
// import '../screens/payment_screen.dart';
// import '../screens/chat_screen.dart';
// import '../screens/profile_screen.dart';
// import '../widgets/custom_text.dart';
// import '../widgets/location_card.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ChatScreen()),
//       );
//     } else if (index == 4) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.menu, size: 30),
//                       onPressed: () {},
//                     ),
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.payment, size: 30),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => const PaymentScreen()),
//                             );
//                           },
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => const ProfileScreen()),
//                             );
//                           },
//                           child: CircleAvatar(
//                             radius: 20,
//                             backgroundColor: Colors.green,
//                             backgroundImage: const AssetImage('assets/images/profile.png'),
//                             onBackgroundImageError: (exception, stackTrace) {
//                               print('Failed to load profile image: assets/images/profile.png');
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const CustomText(
//                   text: 'Get Ready For\nThe Travel Trip!',
//                   size: 32,
//                   weight: FontWeight.bold,
//                   fontFamily: 'Marcellus',
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Find your location...',
//                     hintStyle: const TextStyle(
//                       color: Colors.grey,
//                       fontFamily: 'Gilroy-Medium',
//                     ),
//                     prefixIcon: const Icon(Icons.search, color: Colors.orange),
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 const CustomText(
//                   text: 'MY LOCATION',
//                   size: 18,
//                   fontFamily: 'Gilroy-Bold',
//                 ),
//                 const SizedBox(height: 12),
//                 LocationCard(
//                   imagePath: 'https://images.pexels.com/photos/1368502/pexels-photo-1368502.jpeg',
//                   title: 'Winter in Portugal',
//                   subtitle: 'Lisbon',
//                   likes: 9,
//                   description:
//                   "Portugal there's so much more to discover. Read about the Azores' new wave of eco-travel.",
//                 ),
//                 const SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const CustomText(
//                       text: 'BEST PLACE',
//                       size: 18,
//                       fontFamily: 'Gilroy-Bold',
//                       weight: FontWeight.bold,
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const CustomText(
//                         text: 'SEE ALL',
//                         color: Colors.orange,
//                         size: 14,
//                         fontFamily: 'Gilroy-Medium',
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 SizedBox(
//                   height: 220,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: const [
//                       LocationCard(
//                         imagePath: 'https://images.pexels.com/photos/2363/france-landmark-lights-night.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//                         title: 'France Landmark',
//                         subtitle: 'Paris, France',
//                         price: 3000,
//                         isBestPlace: true,
//                       ),
//                       SizedBox(width: 12),
//                       LocationCard(
//                         imagePath: 'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//                         title: 'Sesimbra e Arrábida',
//                         subtitle: 'Setúbal, Lisbon',
//                         price: 3000,
//                         isBestPlace: true,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: ''),
//         ],
//       ),
//     );
//   }
//
// }
import 'package:flutter/material.dart';
import '../screens/payment_method_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/choice_date_screen.dart';
import '../screens/select_date_screen.dart';
import '../screens/upcoming_tour_screen.dart';
import '../screens/discover_page.dart';
import '../screens/explore_page.dart'; // Add ExplorePage
import '../screens/map_page.dart'; // Add MapPage
import '../screens/hot_place_page.dart'; // Add HotPlacePage
import '../widgets/custom_text.dart';
import '../widgets/location_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xffFF7D0D)),
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
                // Already on MainScreen, no navigation needed
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
                  MaterialPageRoute(
                    builder: (context) => const ChoiceDatePage(),
                  ),
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
                  MaterialPageRoute(
                    builder: (context) => const SelectDatePage(),
                  ),
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
                  MaterialPageRoute(
                    builder: (context) => const UpcomingTourPage(),
                  ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExplorePage()),
                );
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
              title: CustomText(
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
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethodScreen(),
                  ),
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
                  MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ),
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
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder:
                          (context) => IconButton(
                            icon: const Icon(Icons.menu, size: 30),
                            onPressed: () {
                              Scaffold.of(
                                context,
                              ).openDrawer(); // Open the drawer
                            },
                          ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.payment, size: 30),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentScreen(),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green,
                            backgroundImage: const AssetImage(
                              'assets/images/profile.png',
                            ),
                            onBackgroundImageError: (exception, stackTrace) {
                              print(
                                'Failed to load profile image: assets/images/profile.png',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const CustomText(
                  text: 'Get Ready For\nThe Travel Trip!',
                  size: 32,
                  weight: FontWeight.bold,
                  fontFamily: 'Marcellus',
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Find your location...',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Gilroy-Medium',
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xffFF7D0D),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const CustomText(
                  text: 'MY LOCATION',
                  size: 18,
                  fontFamily: 'Gilroy-Bold',
                ),
                const SizedBox(height: 12),
                LocationCard(
                  imagePath:
                      'https://images.pexels.com/photos/1368502/pexels-photo-1368502.jpeg',
                  title: 'Winter in Portugal',
                  subtitle: 'Lisbon',
                  likes: 9,
                  description:
                      "Portugal there's so much more to discover. Read about the Azores' new wave of eco-travel.",
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'BEST PLACE',
                      size: 18,
                      fontFamily: 'Gilroy-Bold',
                      weight: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const CustomText(
                        text: 'SEE ALL',
                        color: Color(0xffFF7D0D),
                        size: 14,
                        fontFamily: 'Gilroy-Medium',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      LocationCard(
                        imagePath:
                            'https://images.pexels.com/photos/2363/france-landmark-lights-night.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        title: 'France Landmark',
                        subtitle: 'Paris, France',
                        price: 3000,
                        isBestPlace: true,
                      ),
                      SizedBox(width: 12),
                      LocationCard(
                        imagePath:
                            'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        title: 'Sesimbra e Arrábida',
                        subtitle: 'Setúbal, Lisbon',
                        price: 3000,
                        isBestPlace: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffFF7D0D),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: '',
          ),
        ],
      ),
    );
  }
}
