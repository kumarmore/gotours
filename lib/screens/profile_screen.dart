import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';
// import '../screens/explore_page.dart';
// import '../screens/map_page.dart';
// import '../screens/chat_screen.dart';
// import '../screens/payment_method_screen.dart';
import '../widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // void _onItemTapped(BuildContext context, int index) {
  //   if (index == 0) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const ExplorePage()),
  //     );
  //   } else if (index == 1) {
  //     // Navigate to a FavoritesScreen (placeholder)
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const FavoritesScreen()),
  //     );
  //   } else if (index == 2) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const ChatScreen()),
  //     );
  //   } else if (index == 3) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const MapPage()),
  //     );
  //   } else if (index == 4) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const CustomText(
          text: 'Profile',
          size: 26,
          weight: FontWeight.bold,
          fontFamily: 'Marcellus',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              // Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     // Background Image
              //     Container(
              //       height: 150,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(12),
              //         image: const DecorationImage(
              //           image: NetworkImage(
              //             'assets/images/profile/cover.png',
              //           ),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),
              //     // Profile Picture
              //     Positioned(
              //       left: 0,
              //       bottom: -40,
              //       child: CircleAvatar(
              //         radius: 40,
              //         backgroundColor: Colors.white,
              //         child: CircleAvatar(
              //           radius: 36,
              //           backgroundImage: const NetworkImage(
              //             'assets/images/profile/profile.png',
              //
              //           ),
              //           onBackgroundImageError: (exception, stackTrace) {
              //             print('Failed to load profile image');
              //           },
              //         ),
              //       ),
              //     ),
              //     // Edit Profile Button
              //     Positioned(
              //       right: 0,
              //       bottom: -40, // Align with the bottom of the CircleAvatar
              //       child: ElevatedButton(
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const SettingsScreen()),
              //           );
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: const Color(0xffFF7D0D),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //         ),
              //         child: const CustomText(
              //           text: 'Edit Profile',
              //           color: Colors.white,
              //           size: 11,
              //           fontFamily: 'Gilroy-bold',
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background Image
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'assets/images/profile/cover.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Profile Picture
                  Positioned(
                    left: 0,
                    bottom: -40,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: const AssetImage('assets/images/profile/profile.png'),
                          onBackgroundImageError: (exception, stackTrace) {
                            print('Failed to load profile image');
                          },
                        ),

                        // Orange Dot
                        Positioned(
                          bottom: 5,
                          right: 7, // Adjust to align with the bottom-right of the avatar
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.orange, // Outer orange dot

                          ),
                        ),
                      ],
                    ),
                  ),
                  // Edit Profile Button
                  Positioned(
                    right: 0,
                    bottom: -40, // Align with the bottom of the CircleAvatar
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingsScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF7D0D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const CustomText(
                        text: 'Edit Profile',
                        color: Colors.white,
                        size: 11,
                        fontFamily: 'Gilroy-bold',
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),
              // User Info
              const CustomText(
                text: 'Hasan Mahmud',
                size: 16,
                weight: FontWeight.bold,
                fontFamily: 'Gilroy-Medium',
              ),
              const SizedBox(height: 8),
              const CustomText(
                text:
                'hello I’m Professional Expert UI/UX Designer\nI have create a App design, Landing page,Web design.\nI am over 3 year experience in UI/UX Design.',
                size: 10,
                color: Colors.grey,
                fontFamily: 'Gilroy-Medium',
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 20, color: Color(0xffFF7D0D)),
                  const SizedBox(width: 4),
                  const CustomText(
                    text: 'Thailand',
                    size: 11,
                    color: Colors.grey,
                    fontFamily: 'Gilroy-Medium',
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.calendar_today, size: 20, color: Color(0xffFF7D0D)),
                  const SizedBox(width: 4),
                  const CustomText(
                    text: 'December 2019',
                    size: 11,
                    color: Colors.grey,
                    fontFamily: 'Gilroy-Medium',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Stats Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const CustomText(
                        text: '30 Post',
                        size: 13,
                        weight: FontWeight.bold,
                        fontFamily: 'Gilroy-Bold',
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                  Column(
                    children: [
                      const CustomText(
                        text: '209 Follower',
                        size: 13,
                        weight: FontWeight.bold,
                        fontFamily: 'Gilroy-Bold',
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                  Column(
                    children: [
                      const CustomText(
                        text: '344 Following',
                        size: 13,
                        weight: FontWeight.bold,
                        fontFamily: 'Gilroy-Bold',
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.grid_on, color: Color(0xffFF7D0D)),
                          const SizedBox(width: 5), // Add spacing between icon and text
                          const Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Gilroy-medium',
                              color: Color(0xffFF7D0D),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.ondemand_video_outlined, color: Colors.grey),
                          const SizedBox(width: 5), // Add spacing between icon and text
                          const Text(
                            'Video',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Gilroy-medium',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.bookmark_border, color: Colors.grey),
                          const SizedBox(width: 5), // Add spacing between icon and text
                          const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Gilroy-medium',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Add spacing between the Row and Divider
                  const Divider(
                    color: Color(0xFFCCCCCC), // Divider color
                    thickness: 0.5,           // Adjust thickness if needed
                  ),
                ],
              ),

              const SizedBox(height: 12),
              // Posts Grid Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'assets/images/profile/Post.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    print('Failed to load post grid image');
                    return const Icon(Icons.broken_image, size: 50);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffFF7D0D),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 4, // Highlight the wallet icon (assuming Profile is related to account)
        // onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
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