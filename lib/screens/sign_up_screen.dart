import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/terms_of_use_screen.dart'; // Import the new screen
import '../widgets/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;
  bool _agreeToTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      if (!_isMaleSelected && !_isFemaleSelected) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your gender')),
        );
        return;
      }
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please agree to the terms of use')),
        );
        return;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  'assets/logos/logo.png',
                  width: 150,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    print('Failed to load logo image: assets/logos/logo.png');
                    return const Icon(Icons.broken_image, size: 50);
                  },
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text: 'Sign Up',
                  size: 24,
                  weight: FontWeight.bold,
                  fontFamily: 'Marcellus',
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Full Name',
                    hintText: 'John Doe',
                  ),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter your full name' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email',
                    hintText: 'davidjohn@gmail.com',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your email';
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'Please enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Gender Checkbox Field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Male Checkbox
                    GestureDetector(
                      onTap: () => setState(() {
                        _isMaleSelected = true;
                        _isFemaleSelected = false;
                      }),
                      child: Container(
                        height: 56,
                        width: (MediaQuery.of(context).size.width - 70) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: 'Male',
                                size: 13,
                                fontFamily: 'Gilroy-Medium',
                                weight: FontWeight.w400,
                              ),
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.grey[400]!,
                                    width: 0.5,
                                  ),
                                  color: _isMaleSelected ? Colors.orange[50] : Colors.transparent,
                                ),
                                child: _isMaleSelected
                                    ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.orange,
                                )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Female Checkbox
                    GestureDetector(
                      onTap: () => setState(() {
                        _isMaleSelected = false;
                        _isFemaleSelected = true;
                      }),
                      child: Container(
                        height: 56,
                        width: (MediaQuery.of(context).size.width - 70) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: 'Female',
                                size: 13,
                                fontFamily: 'Gilroy-Medium',
                                weight: FontWeight.w400,
                              ),
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.grey[400]!,
                                    width: 0.5,
                                  ),
                                  color: _isFemaleSelected ? Colors.orange[50] : Colors.transparent,
                                ),
                                child: _isFemaleSelected
                                    ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.orange,
                                )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your password';
                    if (value.length < 6) return 'Password must be at least 6 characters long';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please confirm your password';
                    if (value != _passwordController.text) return 'Passwords do not match';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (value) => setState(() => _agreeToTerms = value ?? false),
                      activeColor: Colors.orange,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'I agree and accept the ',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Gilroy-Medium',
                            color: Colors.black, // Default color for the first part
                          ),
                          children: [
                            TextSpan(
                              text: 'terms of use',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Gilroy-Medium',
                                color: Colors.orange, // Orange color for "terms of use"
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const TermsOfUseScreen()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const CustomText(
                    text: 'SIGN UP',
                    color: Colors.white,
                    fontFamily: 'Gilroy-bold',
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
                    text: 'ALREADY HAVE AN ACCOUNT? LOG IN',
                    color: Colors.orange,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}