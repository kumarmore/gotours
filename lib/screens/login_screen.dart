import 'package:flutter/material.dart';
import '../screens/sign_up_screen.dart';
import '../screens/main_screen.dart';
import '../screens/forgot_password_screen.dart'; // Added for ForgotPasswordScreen
import '../widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  final String _validEmail = "davidjohn@gmail.com";
  final String _validPassword = "password123";

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
      return;
    }

    if (email == _validEmail && password == _validPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    'assets/logos/logo.png', // Updated to use AssetImage for the logo
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
                text: 'Log In',
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
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Password',
                  size: 16,
                  weight: FontWeight.bold,
                  fontFamily: 'Gilroy-Bold',
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Gilroy-Medium',
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  child: const CustomText(
                    text: 'Forgot Password?',
                    color: Color(0xffFF7D0D),
                    fontFamily: 'Gilroy-Medium',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF7D0D),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const CustomText(
                  text: 'Log In',
                  color: Colors.white,
                  fontFamily: 'Gilroy-Medium',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Add Google login logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Image.asset(
                  // 'assets/logos/google.png',
                  'assets/images/profile.png',
                  height: 30,
                ),
                label: const Text(
                  'Log In With Google',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                child: const CustomText(
                  text: 'Sign Up Here',
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
