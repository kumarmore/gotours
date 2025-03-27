import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../widgets/custom_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final String _validEmail = "davidjohn@gmail.com";

  void _sendResetLink() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }

    if (email == _validEmail) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset link sent! Check your email.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email not found')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent keyboard resizing
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/logos/logo.png', // Correct usage of AssetImage for logo
                    width: 250,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        size: 100,
                        color: Colors.grey,
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 80, left: 40),
                    child: CustomText(
                      text: "Enjoy your travelling",
                      size: 15,
                      fontFamily: 'Gilroy-Medium',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const CustomText(
                text: 'Forgot Password',
                size: 24,
                weight: FontWeight.bold,
                fontFamily: 'Marcellus',
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Email',
                  size: 16,
                  weight: FontWeight.bold,
                  fontFamily: 'Gilroy-Bold',
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'davidjohn@gmail.com',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Gilroy-Medium',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendResetLink,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF7D0D),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const CustomText(
                  text: 'Send Reset Link',
                  color: Colors.white,
                  fontFamily: 'Gilroy-Medium',
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const CustomText(
                  text: 'Back to Log In',
                  color: Color(0xffFF7D0D),
                  fontFamily: 'Gilroy-Medium',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
