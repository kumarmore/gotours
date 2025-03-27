import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/login_screen.dart';
import '../widgets/custom_text.dart';
import '../widgets/navigation_arrows.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'image': 'assets/icons/onboardingpage1/person1.png',
      'title': 'Explore',
      'description': 'Explore your favourite destination \naround the world.',
      'icons': [
        {'asset': 'assets/icons/onboardingpage1/objects1.png', 'position': const Alignment(-0.8, -0.6)},
        {'asset': 'assets/icons/onboardingpage1/cube1.png', 'position': const Alignment(0.9, 0.3)},
        {'asset': 'assets/icons/onboardingpage1/trees1.png', 'position': const Alignment(-0.8, 0.2)},
      ],
    },
    {
      'image': 'assets/icons/onboardingpage2/person2.png',
      'title': 'Easy Peasy',
      'description': 'Make your travel experience very \neasy & peasy.',
      'icons': [
        {'asset': 'assets/icons/onboardingpage2/ball2.png', 'position': const Alignment(-0.8, -0.55)},
        {'asset': 'assets/icons/onboardingpage2/clock2.png', 'position': const Alignment(0.8, 0.28)},
        {'asset': 'assets/icons/onboardingpage2/trees2.png', 'position': const Alignment(-0.8, 0.2)},
      ],
    },
    {
      'image': 'assets/icons/onboardingpage3/person3.png',
      'title': 'Enjoy Tour',
      'description': 'Enjoy your favourite destination with \nyour love one.',
      'icons': [
        {'asset': 'assets/icons/onboardingpage3/heart3.png', 'position': const Alignment(-0.8, -0.6)},
        {'asset': 'assets/icons/onboardingpage3/bell3.png', 'position': const Alignment(0.9, 0.3)},
        {'asset': 'assets/icons/onboardingpage3/objects3.png', 'position': const Alignment(-0.8, 0.4)},
      ],
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _goToNextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _finishOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Center(
                      child: DottedBorder(
                        borderType: BorderType.Circle,
                        radius: const Radius.circular(125),
                        padding: const EdgeInsets.all(16.0),
                        color: const Color(0xFFFFE1D9),
                        strokeWidth: 3,
                        dashPattern: const [4, 5],
                        child: Container(
                          width: 220,
                          height: 220,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFFFD0B2), Color(0xFFFFE9D9)],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ..._onboardingData[index]['icons'].map<Widget>((iconData) {
                      return Align(
                        alignment: iconData['position'],
                        child: Image.asset(
                          iconData['asset'],
                          width: 90,
                          height: 90,
                        ),
                      );
                    }).toList(),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, bottom: 50),
                      child: Center(
                        child: Image.asset(
                          _onboardingData[index]['image']!,
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 60, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: _onboardingData[index]['title']!,
                              size: 45,
                              fontFamily: 'Marcellus', // Apply Marcellus font
                            ),
                            const SizedBox(height: 8),
                            CustomText(
                              text: _onboardingData[index]['description']!,
                              size: 15,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: NavigationArrows(
              currentPage: _currentPage,
              totalPages: _onboardingData.length,
              onPrevious: _goToPreviousPage,
              onNext: _goToNextPage,
            ),
          ),
        ],
      ),
    );
  }
}