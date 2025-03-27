import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';
import 'settings_screen.dart'; // Import the SettingsScreen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          size: 24,
          weight: FontWeight.bold,
          fontFamily: 'Marcellus',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 30),
            onPressed: () {
              // Navigate to SettingsScreen when the settings icon is tapped
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
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
                        image: AssetImage('assets/images/profile/cover.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Profile Picture
                  Positioned(
                    left: 0,
                    bottom: -40,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 36,
                        backgroundImage: const AssetImage('assets/images/profile/profile.png'),
                        onBackgroundImageError: (exception, stackTrace) {
                          print('Failed to load profile image: assets/images/profile/profile.png');
                        },
                        // child: const Icon(Icons.person, size: 50),
                      ),
                    ),
                  ),
                  // Edit Profile Button
                  Positioned(
                    right: 0,
                    bottom: -20,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to SettingsScreen when Edit Profile is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingsScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const CustomText(
                        text: 'Edit Profile',
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              // User Info
              const CustomText(
                text: 'Hasan Mahmud',
                size: 24,
                weight: FontWeight.bold,
                fontFamily: 'Marcellus',
              ),
              const SizedBox(height: 8),
              const Text(
                'I’m Professional Expert UI/UX Designer\nI have create a App design, Landing page,Web design.\nI am over 3 year experience in UI/UX Design.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 20, color: Colors.orange),
                  const SizedBox(width: 4),
                  const CustomText(text: 'Thailand', size: 14, color: Colors.grey),
                  const SizedBox(width: 16),
                  const Icon(Icons.calendar_today, size: 20, color: Colors.orange),
                  const SizedBox(width: 4),
                  const CustomText(text: 'December 2019', size: 14, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 24),
              // Stats Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const CustomText(text: '6', size: 18, weight: FontWeight.bold),
                      const SizedBox(height: 4),
                      const CustomText(text: 'Post', size: 14, color: Colors.grey),
                    ],
                  ),
                  Column(
                    children: [
                      const CustomText(text: '209', size: 18, weight: FontWeight.bold),
                      const SizedBox(height: 4),
                      const CustomText(text: 'Follower', size: 14, color: Colors.grey),
                    ],
                  ),
                  Column(
                    children: [
                      const CustomText(text: '344', size: 18, weight: FontWeight.bold),
                      const SizedBox(height: 4),
                      const CustomText(text: 'Following', size: 14, color: Colors.grey),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.grid_on, color: Colors.orange),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.videocam, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Posts Grid Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/profile/Post.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    print('Failed to load post grid image: assets/images/profile/Post.png');
                    return const Icon(Icons.broken_image, size: 50);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}