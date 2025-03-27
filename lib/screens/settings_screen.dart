import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../widgets/custom_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          text: 'Setting',
          size: 26,
          fontFamily: 'Marcellus',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Profile Section
              Row(
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: const NetworkImage(
                      'https://via.placeholder.com/150', // Replaced with a placeholder network image
                    ),
                    onBackgroundImageError: (exception, stackTrace) {
                      print('Failed to load profile image in SettingsScreen');
                    },
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Hasan Mahmud',
                        size: 16,
                        weight: FontWeight.bold,
                        fontFamily: 'Gilroy-bold',
                      ),
                      const SizedBox(height: 4),
                      const CustomText(
                        text: 'sample@gmail.com',
                        size: 11,
                        color: Colors.grey,
                        fontFamily: 'Gilroy-Medium',
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.black, // Changed to black
                    ),
                    onPressed: () {
                      // Navigate to a detailed profile editing screen if needed
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Preference Section
              Padding(
                padding: const EdgeInsets.only(left: 23), // Align with the Notification icon
                child: const CustomText(
                  text: 'Preference',
                  size: 18,
                  weight: FontWeight.bold,
                  fontFamily: 'Gilroy-bold',
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8), // Background color #F8F8F8
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildSettingItem(
                      icon: Icons.notifications,
                      title: 'Notification',
                      onTap: () {},
                    ),
                    _buildSettingItem(
                      icon: Icons.language,
                      title: 'Language',
                      onTap: () {},
                    ),
                    _buildSettingItem(
                      icon: Icons.attach_money,
                      title: 'Currency',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Banking & Payment Section
              Padding(
                padding: const EdgeInsets.only(left: 23), // Align with the Payment Method icon
                child: const CustomText(
                  text: 'Banking & Payment',
                  size: 18,
                  weight: FontWeight.bold,
                  fontFamily: 'Gilroy-bold',
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(23),
                decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8), // Background color #F8F8F8
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildSettingItem(
                      icon: Icons.payment,
                      title: 'Payment Method',
                      onTap: () {
                        Navigator.pushNamed(context, '/payment_method');
                      },
                    ),
                    _buildSettingItem(
                      icon: Icons.privacy_tip,
                      title: 'Privacy Policy',
                      onTap: () {},
                    ),
                    _buildSettingItem(
                      icon: Icons.description,
                      title: 'Terms of Use',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // Log Out Button
              SizedBox(
                width: double.infinity, // Full-width button
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to LoginScreen on logout
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF7D0D),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, color: Colors.white),
                      SizedBox(width: 8),
                      CustomText(
                        text: 'Log Out',
                        size: 16,
                        color: Colors.white,
                        weight: FontWeight.bold,
                        fontFamily: 'Gilroy-Bold',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.grey),
            const SizedBox(width: 16),
            Expanded(
              child: CustomText(
                text: title,
                size: 13,
                fontFamily: 'Gilroy-Medium',
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black, // Changed to black
            ),
          ],
        ),
      ),
    );
  }
}