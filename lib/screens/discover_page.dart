import 'package:flutter/material.dart';
import '../screens/payment_method_screen.dart';
import '../screens/chat_screen.dart';
import '../widgets/orange_button.dart';
import '../widgets/region_button.dart';
import '../widgets/user_button.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  // State for OrangeButtons in the search bar
  bool isEuropeSelected = true; // "Europe" is selected by default
  bool isFiveStarSelected = true; // "5 Star" is selected by default

  // State for RegionButtons
  String? selectedRegion = 'Europe'; // "Europe" is selected by default

  // State for UserButtons
  String? selectedUserFilter = '5 Star'; // "5 Star" is selected by default

  // State for BottomNavigationBar
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
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Discover",
          style: TextStyle(
            fontSize: 32.0, // Updated to match MainScreen
            fontFamily: "Marcellus",
            fontWeight: FontWeight.bold, // Updated to match MainScreen
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OrangeButton(
                        text: "Europe",
                        isSelected: isEuropeSelected,
                        onTap: () {
                          setState(() {
                            isEuropeSelected = !isEuropeSelected;
                          });
                        },
                      ),
                      const SizedBox(width: 13.0),
                      OrangeButton(
                        text: "5 Star",
                        isSelected: isFiveStarSelected,
                        onTap: () {
                          setState(() {
                            isFiveStarSelected = !isFiveStarSelected;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "By Region",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: "Gilroy-Bold",
                  ),
                ),
                const SizedBox(height: 20.0),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 25.0,
                  childAspectRatio: 2.2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    RegionButton(
                      text: "Asia",
                      isSelected: selectedRegion == "Asia",
                      onTap: () {
                        setState(() {
                          selectedRegion = "Asia";
                        });
                      },
                    ),
                    RegionButton(
                      text: "Africa",
                      isSelected: selectedRegion == "Africa",
                      onTap: () {
                        setState(() {
                          selectedRegion = "Africa";
                        });
                      },
                    ),
                    RegionButton(
                      text: "Europe",
                      isSelected: selectedRegion == "Europe",
                      onTap: () {
                        setState(() {
                          selectedRegion = "Europe";
                        });
                      },
                    ),
                    RegionButton(
                      text: "America",
                      isSelected: selectedRegion == "America",
                      onTap: () {
                        setState(() {
                          selectedRegion = "America";
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "By User",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: "Gilroy-Bold",
                  ),
                ),
                const SizedBox(height: 20.0),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 25.0,
                  childAspectRatio: 2.2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    UserButton(
                      text: "Popular",
                      isSelected: selectedUserFilter == "Popular",
                      onTap: () {
                        setState(() {
                          selectedUserFilter = "Popular";
                        });
                      },
                    ),
                    UserButton(
                      text: "Best Choice",
                      isSelected: selectedUserFilter == "Best Choice",
                      onTap: () {
                        setState(() {
                          selectedUserFilter = "Best Choice";
                        });
                      },
                    ),
                    UserButton(
                      text: "Last Trip's",
                      isSelected: selectedUserFilter == "Last Trip's",
                      onTap: () {
                        setState(() {
                          selectedUserFilter = "Last Trip's";
                        });
                      },
                    ),
                    UserButton(
                      text: "5 Star",
                      isSelected: selectedUserFilter == "5 Star",
                      onTap: () {
                        setState(() {
                          selectedUserFilter = "5 Star";
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
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
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: ''),
        ],
      ),
    );
  }
}