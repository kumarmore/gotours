import 'package:flutter/material.dart';
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
          size: 24,
          weight: FontWeight.bold,
          fontFamily: 'Marcellus',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: const AssetImage('assets/images/profile.png'),
                  onBackgroundImageError: (exception, stackTrace) {
                    print('Failed to load profile image in SettingsScreen: assets/images/profile.png');
                  },
                  child: const Icon(Icons.person, size: 40),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Hasan Mahmud',
                      size: 20,
                      weight: FontWeight.bold,
                      fontFamily: 'Marcellus',
                    ),
                    const SizedBox(height: 4),
                    const CustomText(
                      text: 'sample@gmail.com',
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 20),
                  onPressed: () {
                    // Navigate to a detailed profile editing screen if needed
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Preference Section
            const CustomText(
              text: 'Preference',
              size: 18,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 32),
            // Banking & Payment Section
            const CustomText(
              text: 'Banking & Payment',
              size: 18,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            _buildSettingItem(
              icon: Icons.payment,
              title: 'Payment Method',
              onTap: () {
                // Navigate to PaymentMethodScreen (already exists in your app)
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
            const Spacer(),
            // Log Out Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement log out functionality (e.g., clear user data and navigate to login screen)
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
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
                size: 16,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}