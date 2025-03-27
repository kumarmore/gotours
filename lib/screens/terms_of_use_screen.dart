import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

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
          text: 'Terms of Use',
          size: 24,
          weight: FontWeight.bold,
          fontFamily: 'Marcellus',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Terms of Use',
                size: 20,
                weight: FontWeight.bold,
                fontFamily: 'Marcellus',
              ),
              SizedBox(height: 20),
              CustomText(
                text: '''
Welcome to GoTour! By using our app, you agree to the following terms of use. Please read them carefully.

1. **Acceptance of Terms**
By accessing or using the GoTour app, you agree to be bound by these Terms of Use, including any additional guidelines and future updates. If you do not agree to these terms, please do not use the app.

2. **Use of the App**
- You must be at least 13 years old to use this app.
- You agree to use the app only for lawful purposes and in a way that does not infringe the rights of others.
- You are responsible for maintaining the confidentiality of your account and password.

3. **User Content**
- You may post content, such as reviews, photos, and comments, on the app.
- By posting content, you grant GoTour a non-exclusive, royalty-free, worldwide license to use, modify, and display that content.
- You are responsible for ensuring that your content does not violate any laws or the rights of others.

4. **Privacy**
Your use of the app is also governed by our Privacy Policy, which explains how we collect, use, and protect your personal information.

5. **Termination**
We reserve the right to terminate or suspend your account at any time, without notice, for conduct that we believe violates these Terms of Use or is harmful to other users of the app.

6. **Disclaimer**
The app is provided "as is" without warranties of any kind. We do not guarantee that the app will be error-free or uninterrupted.

7. **Contact Us**
If you have any questions about these Terms of Use, please contact us at support@gotour.com.

Last updated: March 26, 2025
                ''',
                size: 14,
                fontFamily: 'Gilroy-Medium',
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}